#!/usr/bin/env python
# -*- coding: utf-8 -*-
from app.model.SysUser import SysUser
from app.model.SysRole import SysRole
from app.model.SysMenu import SysMenu
import json


class UserService():
    def __init__(self):
        pass

    '''
    根据用户名和密码获取用户信息
    '''

    @staticmethod
    def is_empty_user(username, password):
        return SysUser.query.filter_by(login_name=username, password=password).first()

    '''
    根据用户ID获取用户信息
    '''

    @staticmethod
    def user_by_id(id):
        return SysUser.query.filter_by(id=id).first()

    @staticmethod
    def user_menu(id):
        result = SysMenu.query.join(SysRole.roleMenu).join(SysRole).join(SysUser.userRole).join(SysUser).filter(
            SysUser.id == id
        ).order_by(SysMenu.sort.asc()).all()
        user_info = UserService.user_by_id(id)
        info = {
            "name": user_info.name,
            "id": user_info.id,
            "avatar": user_info.avatar,
            "login_flag": user_info.login_flag,
            'role': {
                "id": user_info.roles[:1][0].id,
                "name": user_info.roles[:1][0].name,
                "enname": user_info.roles[:1][0].enname,
                "office_id": user_info.roles[:1][0].office_id,
                "permissions": []
            }
        }
        dict_list = []
        if len(result) > 0:
            for i in result:
                jsons = {
                    "id": i.id,
                    "parent_id": i.parent_id,
                    "name": i.name,
                    "alias": i.alias,
                    "icon": i.icon,
                    "sort": i.sort,
                    "layout": i.layout,
                    "permission": i.permission,
                    "actions": None if not i.actions else json.loads(i.actions, encoding='utf-8'),
                }
                dict_list.append(jsons)
        info['role']['permissions'] = dict_list
        return info
