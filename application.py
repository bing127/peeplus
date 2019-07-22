# -*- coding: utf-8 -*-
from flask import Flask
from flask_script import Manager
from flask_sqlalchemy import SQLAlchemy
import os
from flask_cors import CORS
from datetime import timedelta


class Application(Flask):
    def __init__(self, import_name, template_folder=None, root_path=None):
        super(Application, self).__init__(import_name, template_folder=template_folder, root_path=root_path,
                                          static_folder=None)
        self.config.from_pyfile('config/config.default.py')
        db.init_app(self)


db = SQLAlchemy()
app = Application(__name__, template_folder=os.getcwd() + "/app/templates/", root_path=os.getcwd())
manager = Manager(app)
CORS(app, supports_credentials=True)
app.secret_key = app.config['SESSION_KEY']
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(app.config['SESSION_TIME'])

'''
函数模板
'''
from app.helper.UrlManager import UrlManager

app.add_template_global(UrlManager.buildStaticUrl, 'buildStaticUrl')
app.add_template_global(UrlManager.buildUrl, 'buildUrl')
app.add_template_global(UrlManager.buildImageUrl, 'buildImageUrl')
