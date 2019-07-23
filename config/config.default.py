#!/usr/bin/python3
# -*- coding: utf-8 -*-
'''
项目启动配置
'''
SERVER_DEBUG = True
SERVER_PORT = 8181
SERVER_HOST = '0.0.0.0'

'''
mysql配置
'''
SQLALCHEMY_ECHO = False
SQLALCHEMY_DATABASE_URI = 'mysql://root:123456@127.0.0.1/peeplus?charset=utf8mb4'
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_ENCODING = "utf8mb4"

'''
session设置
'''

SESSION_KEY = 'peeplus'
# m
SESSION_TIME = 30

'''
上传文件配置
'''
UPLOAD = {
    'ext': ['jpg', 'gif', 'bmp', 'jpeg', 'png'],
    'prefix_path': '/app/static/upload/',
    'prefix_url': '/static/upload/'
}
'''
项目版本设置
'''
RELEASE_VERSION = "1.0.1"
APP_NAME = "Peeplus"
APP_DES = "Peeplus 快速开发平台"
APP_COPYRIGHT = "2019 ~ 2022"

##过滤url
IGNORE_URLS = [
    "^/user/login",
    "^/user/captcha"
]

IGNORE_CHECK_LOGIN_URLS = [
    "^/static",
    "^/favicon.ico"
]

API_IGNORE_URLS = [
    "^/api"
]

APP = {
    'domain': 'http://127.0.0.1:8989'
}
