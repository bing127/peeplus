# coding: utf-8
from sqlalchemy import Column, DateTime, Integer, String, Text
from sqlalchemy.schema import FetchedValue
from application import db

class SysMenu(db.Model):
    __tablename__ = 'sys_menu'

    id = db.Column(db.String(64), primary_key=True)
    parent_id = db.Column(db.String(64))
    name = db.Column(db.String(128), nullable=False)
    alias = db.Column(db.String(255))
    permission = db.Column(db.String(255))
    layout = db.Column(db.String(255))
    keep = db.Column(db.String(1))
    actions = db.Column(db.Text)
    icon = db.Column(db.String(30))
    sort = db.Column(db.Integer, server_default=db.FetchedValue())
    create_by = db.Column(db.String(64))
    create_date = db.Column(db.DateTime)
    update_by = db.Column(db.String(64))
    update_date = db.Column(db.DateTime)
    del_flag = db.Column(db.String(0))
    remarks = db.Column(db.String(257))
