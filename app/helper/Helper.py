from flask import render_template, g
import datetime
import uuid

class Helper():
    def __init__(self):
        pass

    '''
    统一渲染方法
    '''

    @staticmethod
    def custom_render(template, context={}):
        if 'current_user' in g:
            context['current_user'] = g.current_user
        return render_template(template, **context)

    '''
    获取当前时间
    '''

    def getCurrentDate(format="%Y-%m-%d %H:%M:%S"):
        return datetime.datetime.now()

    '''
    获取格式化的时间
    '''

    @staticmethod
    def getFormatDate(date=None, format="%Y-%m-%d %H:%M:%S"):
        if date is None:
            date = datetime.datetime.now()
        return date.strftime(format)

    '''
    uuid格式化
    '''
    @staticmethod
    def getUUid():
        return str(uuid.uuid1()).replace('-','')

