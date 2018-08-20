import base64
import os
import bcrypt
import hashlib
import urllib

import io

import tornado.auth
import tornado.escape
import tornado.gen
import tornado.httpserver
import logging
import json
import time
import threading
import functools

from tornado.ioloop import IOLoop
from tornado.web import asynchronous, RequestHandler, Application
from tornado.httpclient import AsyncHTTPClient

class AboutHandler(RequestHandler):
    def get(self):
        self.render("../templates/about.html")