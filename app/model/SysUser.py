# coding: utf-8
from sqlalchemy import Column, DateTime, String,func
from application import db
from app.model.SysRole import SysRole  #角色表

user_role =db.Table('sys_user_role',db.Column('user_id',db.String(64),db.ForeignKey('sys_user.id')),
                    db.Column('role_id',db.String(64),db.ForeignKey('sys_role.id')))

class SysUser(db.Model):
    __tablename__ = 'sys_user'

    id = db.Column(db.String(64), primary_key=True)
    company_id = db.Column(db.String(64), index=True)
    office_id = db.Column(db.String(64), index=True)
    login_name = db.Column(db.String(100, 'utf8_bin'), index=True)
    password = db.Column(db.String(100, 'utf8_bin'))
    no = db.Column(db.String(100, 'utf8_bin'))
    name = db.Column(db.String(100, 'utf8_bin'))
    email = db.Column(db.String(200, 'utf8_bin'))
    phone = db.Column(db.String(200, 'utf8_bin'))
    mobile = db.Column(db.String(200, 'utf8_bin'))
    avatar = db.Column(db.String(1000, 'utf8_bin'))
    login_ip = db.Column(db.String(100, 'utf8_bin'))
    login_date = db.Column(db.DateTime)
    login_flag = db.Column(db.String(64, 'utf8_bin'))
    create_by = db.Column(db.String(64))
    create_date = db.Column(db.DateTime,server_default=func.now())
    update_by = db.Column(db.String(64))
    update_date = db.Column(db.DateTime, index=True,server_default=func.now(), onupdate=func.now())
    remarks = db.Column(db.String(255, 'utf8_bin'))
    del_flag = db.Column(db.String(1), index=True, server_default=db.FetchedValue())
    qrcode = db.Column(db.String(1000, 'utf8_bin'))
    sign = db.Column(db.String(450, 'utf8mb4_general_ci'))

    roles = db.relationship('SysRole', secondary=user_role, backref=db.backref('users'))
    userRole = user_role
