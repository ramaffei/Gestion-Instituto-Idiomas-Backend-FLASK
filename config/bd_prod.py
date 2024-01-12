import os

BD_TYPE = 'mysql+pymysql'
BD_USER = os.getenv('BD_USER')
BD_PASSWORD = os.getenv('BD_PASSWORD')
BD_HOST = 'localhost'
BD_NAME = os.getenv('BD_NAME')

SQLALCHEMY_DATABASE_URI = f'{BD_TYPE}://{BD_USER}:{BD_PASSWORD}@{BD_HOST}/{BD_NAME}'

