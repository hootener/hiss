#!/usr/bin/env python
import os
import tornado.ioloop
import tornado.web

from handlers.about import AboutHandler

settings = {
    "static_path": os.path.join(os.path.dirname(__file__), "static"),
    "cookie_secret": "123456789123456789",
    "login_url": "/login",
    "xsrf_cookies": True,
}

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world!")

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/about", AboutHandler)
    ], **settings, debug=True)

def main():
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()

if __name__ == "__main__":
    main()
    
