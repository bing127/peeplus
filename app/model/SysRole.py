# coding: utf-8
from sqlalchemy import Column, DateTime, String

from application import db
role_menu =db.Table('sys_role_menu',db.Column('role_id',db.String(64),db.ForeignKey('sys_role.id')),
                    db.Column('menu_id',db.String(64),db.ForeignKey('sys_menu.id')))


class SysRole(db.Model):
    __tablename__ = 'sys_role'

    id = db.Column(db.String(64), primary_key=True)
    office_id = db.Column(db.String(64))
    name = db.Column(db.String(100, 'utf8_bin'), nullable=False)
    enname = db.Column(db.String(255, 'utf8_bin'), index=True)
    role_type = db.Column(db.String(255, 'utf8_bin'))
    is_sys = db.Column(db.String(64, 'utf8_bin'))
    useable = db.Column(db.String(64, 'utf8_bin'))
    create_by = db.Column(db.String(64), nullable=False)
    create_date = db.Column(db.DateTime, nullable=False)
    update_by = db.Column(db.String(64), nullable=False)
    update_date = db.Column(db.DateTime, nullable=False)
    remarks = db.Column(db.String(255, 'utf8_bin'))
    del_flag = db.Column(db.String(1), nullable=False, index=True, server_default=db.FetchedValue())

    menus = db.relationship('SysRole', secondary=role_menu, backref=db.backref('roles'))

    roleMenu = role_menu
