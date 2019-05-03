#! /usr/bin/env python3
# ReScience yaml to README converter
# Released under the BSD two-clauses licence

def generate_README(article):

    content = (
        "**{_.title}**, {_.authors_abbrv}, "
        "ReScience {_.journal_volume}(#{_.article_number}), {_.date_published.year}.\n"
        "\n"
        "**Abstract.** {_.abstract}\n"
        "\n"
        "**Keywords:** {_.keywords}\n"
        "\n"
        "**A Replication of** "
        "[{_.replication.bib}](http://doi.org/{_.replication.doi})  \n"
        "\n"
        "----\n"
        "\n"
        "**Cite as**: {_.title}, {_.authors_abbrv}, "
        "ReScience {_.journal_volume}(#{_.article_number}), {_.date_published.year}. "
        "**DOI**: [{_.article_doi}](http://doi.org/{_.article_doi}).\n"
        "\n"
        "**Code repository** at [{_.code.url}](https://{_.code.url}) - "
        "**DOI** [{_.code.doi}](http://doi.org/{_.code.doi})  \n"
        "**Data repository** at [{_.data.url}](https://{_.data.url}) - "
        "**DOI** [{_.data.doi}](http://doi.org/{_.data.doi})  \n"
        "\n"
        "**Edited** by {_.editors[0].name} - "
        "**Reviewed** by {_.reviewers[0].name} and {_.reviewers[1].name}  \n"
        "**Received** {_.date_received} - "
        "**Accepted** {_.date_accepted} - "
        "**Published** {_.date_published} - "
        "[Open Review](_.review.url)  \n"
        "**Copyright** © {_.date_published.year} {_.authors_abbrv}  \n"
        "\n"
        "**Published** under a "
        "[Creative Commons Attribution 4.0 International license]"
        "(https://creativecommons.org/licenses/by/4.0/)  \n"
        "**Corresponding author**:"
        "{_.contact.name} ([{_.contact.email}](mailto:{_.contact.email}))  \n"
        "**Competing Interests**: The authors have declared that no competing interests exist\n"
        "".format(_=article))
                
    return content



# -----------------------------------------------------------------------------
if __name__ == '__main__':
    import argparse
    from article import Article

    parser = argparse.ArgumentParser(description='YAML to markdown converter.')
    parser.add_argument('--input', '-i', dest='filename_in', action='store',
                        default="metadata.yaml", help='input YAML file')
    parser.add_argument('--output', "-o", dest='filename_out', action='store',
                        help='output markdown file')
    args = parser.parse_args()

    filename_in  = args.filename_in
    filename_out = args.filename_out

    # print("Generating markdown README ({1}) from {0}".format(filename_in, filename_out))
    
    with open(filename_in, "r") as file:
        article = Article(file.read())

    if len(article.authors) > 0:
        content = generate_README(article)
        if filename_out is not None:
            with open(filename_out, "w") as file:
                file.write(content)
        else:
            print(content)
    else:
        print("Error! No author found.")
