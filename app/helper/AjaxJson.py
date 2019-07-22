#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/5/18 23:45
# @Author  : Py.i5yi
# @File    : AjaxJson.py
# @Software: PyCharm
import time

class AjaxJson():
    def __init__(self):
        pass

    @staticmethod
    def jsonFn(result={}, success=True, message='操作成功', code=200, **kwargs):
        return {"code": code, "message": message, "success": success, "result": result, **kwargs,"timestamp":int(round(time.time()*1000))}
