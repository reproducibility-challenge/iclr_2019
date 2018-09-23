import os
import re
import aiohttp
from aiohttp import web
from gidgethub import routing, sansio
from gidgethub import aiohttp as gh_aiohttp
import gspread
from oauth2client.service_account import ServiceAccountCredentials
import pandas
import json
import logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
import pdb


service_account_info = json.load(open(os.environ.get("GOOGLE_CRED_FILE")))
#credentials = service_account.Credentials.from_service_account_info(
#    service_account_info)
scope = ['https://spreadsheets.google.com/feeds',
         'https://www.googleapis.com/auth/drive']
credentials = ServiceAccountCredentials.from_json_keyfile_name(os.environ.get("GOOGLE_CRED_FILE"), scope)

USERNAME = 'reproducibility-org'
REGEX_PATT = r'@reproducibility-org\s(.+)'
GOOGLE_SPREADSHEET_KEY = os.environ.get("GOOGLE_SPREADSHEET_KEY")
AUTHOR_FIELD_COL = 'Please submit the Github user ID of Team lead'

router = routing.Router()
gc = gspread.authorize(credentials)


def check_user(issue_number, author_id):
    """ Check if user is authorized to perform the operation """
    sheet = gc.open_by_key(GOOGLE_SPREADSHEET_KEY).sheet1
    data = pandas.DataFrame(sheet.get_all_records())
    logging.info("Accessing database, {} rows found".format(len(data)))
    # pdb.set_trace()
    row = data[data['issue_number'] == issue_number]
    if len(row) > 0:
        allowed_author = row[AUTHOR_FIELD_COL].tolist()[0]
        return allowed_author == author_id
    return False

@router.register("issue_comment", action="created")
async def issue_comment_event(event, gh, *args, **kwargs):
    """ Whenever someone comments on the issue, check if @reprobot is called."""
    comments_url = event.data["issue"]["comments_url"]
    issue_url = event.data["issue"]["url"]
    issue_number = event.data["issue"]["number"]
    label_url = event.data["issue"]["labels_url"]
    existing_labels = event.data["issue"]["labels"]
    author = event.data["comment"]["user"]["login"]
    comment = event.data["comment"]["body"]
    logging.info("Incoming comment from {} on issue {}, : {}".format(author, issue_number, comment))
    issue_state = event.data["issue"]["state"]
    com = re.search(REGEX_PATT, comment)
    if com and check_user(issue_number, author):
        logging.info("Valid user")
        logging.info("Command invoked : {}".format(com))
        response = ''
        command = com.group(1)
        if command == 'help':
            response = 'Here is what I can do for you:\n' + \
                        'complete: To notify that you have completed the Reproducibility Challenge \n' + \
                        'close: To leave the competition and making the paper open to reproducibility \n'
        elif command == 'complete':
            # set label complete
            # close issue
            if issue_state == 'open':
                # add label complete
                response = 'Thank you for completing the Reproducibility project! Now open Pull Requests (PR) by referring this issue # with your report / code / paper'
                await gh.put(label_url, data=["complete"])
        elif command == 'close':
            labels = [label['name'] for label in existing_labels]
            # set label relinquished
            if issue_state == 'open':
                if 'complete' not in labels:
                    response = 'Thank you for participating in the challenge. This paper is now open for further claims.'
                    # add label
                    await gh.put(label_url, data=["relinquished"])
                    # close the issue
                    await gh.patch(issue_url, data={"state":"closed"})
                else:
                    response = 'Sorry, you cannot close an issue which is complete. Try `@reproducibility-org help` to see what I can do.'
        else:
            response = 'Sorry, I do not recognize the command. Type `@reproducibility-org help` to see what can I do.'
        await gh.post(comments_url, data={"body": response})

async def main(request):
    # read the GitHub webhook payload
    body = await request.read()

    # our authentication token and secret
    secret = os.environ.get("GH_SECRET")
    oauth_token = os.environ.get("GH_AUTH")

    # a representation of GitHub webhook event
    event = sansio.Event.from_http(request.headers, body, secret=secret)

    # instead of mariatta, use your own username
    async with aiohttp.ClientSession() as session:
        gh = gh_aiohttp.GitHubAPI(session, USERNAME,
                                  oauth_token=oauth_token)

        logging.info(event.event)
        # call the appropriate callback for the event
        await router.dispatch(event, gh)

    # return a "Success"
    return web.Response(status=200)





if __name__ == "__main__":
    app = web.Application()
    app.router.add_post("/", main)
    port = os.environ.get("PORT")
    if port is not None:
        port = int(port)

    web.run_app(app, port=port)