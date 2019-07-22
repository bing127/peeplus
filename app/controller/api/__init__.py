from flask import Blueprint
route_api = Blueprint('api_router', __name__)

from app.controller.api.user.user import *

@route_api.route("/")
def index():
    return "Mina Api V1.0~~"
