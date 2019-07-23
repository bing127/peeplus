#!/usr/bin/env python
# -*- coding: utf-8 -*-
from app.model.SysMenu import SysMenu
import json

class MenuService():
    def __init__(self):
        pass

    @staticmethod
    def getMenuList(pageNo= 1, pageSize=10, likeName= None, likeId = None):
        try:
            likeName = '' if not likeName else likeName
            likeId = '' if not likeId else likeId
            result = SysMenu.query.filter(SysMenu.alias.like('%' + likeName + '%')).filter(SysMenu.id.like('%' + likeId + '%')).paginate(page=int(pageNo),
                                                                                            per_page=int(pageSize),
                                                                                            error_out=False)
            json_list = []
            if result.items and len(result.items) > 0:
                for i in result.items:
                    jsons = {
                        "id": i.id,
                        "parent_id": i.parent_id,
                        "name": i.name,
                        "alias": i.alias,
                        "icon": i.icon,
                        "sort": i.sort,
                        "layout": i.layout,
                        "permission": i.permission,
                        "keep": False if not i.keep else True,
                        "actions": None if not i.actions else json.loads(i.actions, encoding='utf-8'),
                    }
                    json_list.append(jsons)

            return {
                "data": json_list,
                "pageNo":result.page,
                "totalCount": result.total
            }
        except Exception as e:
            return {
                "data":[]
            }
