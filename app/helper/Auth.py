#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/5/21 23:20
# @Author  : Py.i5yi
# @File    : Auth.py
# @Software: PyCharm

import jwt
import time
from flask import request, jsonify, g
from functools import wraps
from app.helper.AjaxJson import AjaxJson


def create_token(account_id, username):
    payload = {
        "iat": int(time.time()),
        "exp": int(time.time()) + 60*30,
        "sub": account_id,
        "username": username,
        "user_id": account_id
    }
    return jwt.encode(payload, 'secret', algorithm='HS256')


def verify_refresh_token(token):
    try:
        payload = jwt.decode(token, 'secret', algorithms=['HS256'])
        if payload:
            return payload
        else:
            raise jwt.InvalidTokenError
    except jwt.ExpiredSignatureError:
        return False

    except jwt.InvalidTokenError:
        return False


def auth_jwt(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        token = request.headers.get('Access-Token')
        if token is None:
            return jsonify(AjaxJson.jsonFn(message='token未提交', success=False))
        else:
            user = verify_refresh_token(token)
            if user is None or not user:
                return jsonify(AjaxJson.jsonFn(message='授权失败', success=False))
            if g.current_user is None:
                return jsonify(AjaxJson.jsonFn(message='未登录', success=False))
            else:
                return func(*args,**kwargs)
    return wrapper
