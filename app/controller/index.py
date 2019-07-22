# -*- coding: utf-8 -*-
from application import app, db
from flask import Blueprint
from app.helper.Helper import Helper

route_index = Blueprint('index_page', __name__)


@route_index.route('/', defaults={'path': ''})
@route_index.route('/<path:path>')
def index(path):
    return Helper.custom_render("sys/index.html")
