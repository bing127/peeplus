# -*- coding: utf-8 -*-
from flask import request,g
from application import app,db
import json
from app.model.SysLog import SysLog
from app.helper.Helper import Helper

class LogService():
    @staticmethod
    def addAccessLog():
        target = SysLog()
        target.request_uri = request.url
        target.remote_addr = request.remote_addr
        target.params = json.dumps(  request.values.to_dict() )
        if 'current_user' in g and g.current_user is not None:
            target.id = g.current_user.id
            target.create_by = g.current_user.id
        else:
            target.id = Helper.getUUid()
            target.create_by = Helper.getUUid()
        target.user_agent = request.headers.get( "User-Agent" )
        target.create_date = Helper.getFormatDate()
        target.method = request.method
        db.session.add( target )
        db.session.commit( )
        return True
