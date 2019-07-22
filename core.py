#!/usr/bin/python3
# -*- coding: utf-8 -*-
'''
核心基类
'''
from application import app
from app.helper.Log import BaseError,OrmError
from flask import jsonify
'''
统一拦截处理和统一错误处理
'''
from app.helper.AuthInterceptor import *
'''
蓝图功能，对所有的url进行蓝图功能配置
'''

from app.controller.index import route_index
from app.controller.static import route_static
from app.controller.api import route_api

app.register_blueprint(route_index, url_prefix="/")
app.register_blueprint(route_static, url_prefix="/static")
app.register_blueprint(route_api, url_prefix="/api")


@app.errorhandler(BaseError)
def custom_error_handler(e):
    if e.level in [BaseError.LEVEL_WARN, BaseError.LEVEL_ERROR]:
        if isinstance(e, OrmError):
            app.logger.exception('%s %s' % (e.parent_error, e))
        else:
            app.logger.exception('错误信息: %s %s' % (e.extras, e))
    response = jsonify(e.to_dict())
    response.status_code = e.status_code
    return response
