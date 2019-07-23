#!/usr/bin/env python
# -*- coding: utf-8 -*-

from application import app, db
from flask import session
from app.helper.AjaxJson import AjaxJson
from app.controller.api import route_api
from app.helper.Auth import *
from app.service.menu.menu import MenuService

'''
获取用户信息
'''
@route_api.route("/menu/list", methods=['GET'])
@auth_jwt
def menu_list():
    pageNo = request.args.get("pageNo")
    pageSize = request.args.get("pageSize")
    alias = request.args.get("alias")
    id = request.args.get("id")
    menu_infos = MenuService.getMenuList(pageNo= pageNo,pageSize= pageSize,likeName= alias, likeId= id)
    return jsonify(AjaxJson.jsonFn(result=menu_infos))

