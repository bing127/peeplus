# -*- coding: utf-8 -*-
from application import app, manager
from flask_script import Server
import core

manager.add_command("runserver", Server(host=app.config["SERVER_HOST"], port=app.config["SERVER_PORT"],
                                        use_debugger=app.config["SERVER_DEBUG"], use_reloader=True, threaded=True))


def main():
    manager.run()


if __name__ == '__main__':
    try:
        import sys
        # import app.helper.Log

        sys.exit(main())
    except Exception as e:
        import traceback

        traceback.print_exc()
