#!/usr/bin/env python
# -*- coding: utf-8 -*-

from application import app, db
from flask import session, url_for, make_response, request, jsonify, g
from app.helper.AjaxJson import AjaxJson
from app.controller.api import route_api
from app.helper.Auth import *
from app.service.user.user import UserService

'''
@url /api/auth/login
@des 登录
'''


@route_api.route("/auth/login", methods=['POST'])
def auth_login():
    try:
        req = request.get_json()
        user = UserService.is_empty_user(req['username'], req['password'])
        if user is None:
            return jsonify(AjaxJson.jsonFn(message='用户不存在或密码错误', success=False))
        else:
            str_token = str(create_token(user.id, user.login_name), encoding="utf-8")
            session['current_user'] = user.id
            return jsonify(AjaxJson.jsonFn(message="登录成功", token=str_token, name=user.name))
    except Exception as e:
        return jsonify(AjaxJson.jsonFn(message='用户不存在或密码错误', success=False))


'''
获取用户信息
'''
@route_api.route("/user/info", methods=['GET'])
@auth_jwt
def user_info():
    user_id = session['current_user']
    user_infos = UserService.user_menu(user_id)
    return jsonify(AjaxJson.jsonFn(result=user_infos))

'''
退出登录
'''
@route_api.route( "/user/logout" )
def logout():
    session['current_user'] = None
    g.current_user = None
    return jsonify(AjaxJson.jsonFn(message='退出成功', success=True))
