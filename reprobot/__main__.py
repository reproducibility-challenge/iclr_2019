import os

from aiohttp import web

async def main(request):
    return web.Response(status=200, text="Hello world!")


if __name__ == "__main__":
    app = web.Application()
    app.router.add_get("/", main)
    port = os.environ.get("PORT")
    if port is not None:
        port = int(port)

    web.run_app(app, port=port)