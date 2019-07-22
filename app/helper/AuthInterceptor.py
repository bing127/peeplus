# -*- coding: utf-8 -*-
from application import app
from flask import g, session, request
from app.service.LogService import LogService
import json
import re

@app.before_request
def before_request():
    ignore_check_login_urls = app.config['IGNORE_CHECK_LOGIN_URLS']
    path = request.path

    # 如果是静态文件就不要查询用户信息了
    pattern = re.compile('%s' % "|".join(ignore_check_login_urls))
    if pattern.match(path):
        return

    user_info = check_login()
    g.current_user = None
    if user_info:
        g.current_user = user_info
    return


'''
判断用户是否已经登录
'''


def check_login():
    if 'current_user' in session:
        return json.loads(session['current_user'])
    else:
        # 加入日志
        # LogService.addAccessLog()
        return False
