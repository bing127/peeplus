# coding: utf-8
from sqlalchemy import Column, DateTime, String, Text
from sqlalchemy.schema import FetchedValue
from application import db

class SysLog(db.Model):
    __tablename__ = 'sys_log'

    id = db.Column(db.String(64), primary_key=True)
    type = db.Column(db.String(1, 'utf8_bin'), index=True, server_default=db.FetchedValue())
    title = db.Column(db.String(255, 'utf8_bin'))
    create_by = db.Column(db.String(64), index=True)
    create_date = db.Column(db.DateTime, index=True)
    remote_addr = db.Column(db.String(255, 'utf8_bin'))
    user_agent = db.Column(db.String(255, 'utf8_bin'))
    request_uri = db.Column(db.String(255, 'utf8_bin'), index=True)
    method = db.Column(db.String(5, 'utf8_bin'))
    params = db.Column(db.Text(collation='utf8_bin'))
    exception = db.Column(db.Text(collation='utf8_bin'))
