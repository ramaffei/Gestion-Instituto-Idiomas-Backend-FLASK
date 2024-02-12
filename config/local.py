
from config.default import *

DEBUG = True

FRONTEND_HOST = 'http://localhost:4200'

BD_TYPE = 'mysql+pymysql'
BD_USER = 'enrollFun'
BD_PASSWORD = r'789456'
BD_HOST = 'localhost'
BD_NAME = 'enrollFun'

SQLALCHEMY_DATABASE_URI = f'{BD_TYPE}://{BD_USER}:{BD_PASSWORD}@{BD_HOST}/{BD_NAME}'


print(APP_ENV)