from flask import jsonify
from werkzeug.exceptions import HTTPException

class AppErrorBaseClass(Exception):
   pass
class ObjectNotFound(AppErrorBaseClass):
   pass

class UnAuthorize(AppErrorBaseClass):
   pass

def custom_api_error_handler(exception):
  payload = {
    'type': 'InternalServerError',
    'description': 'Internal Error',
    }
  if isinstance(exception, HTTPException):
    payload['type'] = 'HTTPException'
    payload['description'] = exception.description
    status_code = exception.code
  else:
    payload['description'] = exception.args
    status_code = 500
  return jsonify(payload), status_code