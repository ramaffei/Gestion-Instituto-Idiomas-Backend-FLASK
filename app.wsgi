import sys 
import os
os.environ['APP_SETTINGS_MODULE'] =  'config.prod'
os.environ['BD_USER'] =  "oxford"
os.environ['BD_NAME'] =  "enrollFun"
os.environ['BD_PASSWORD'] =  "8VelRaIEza9DCnj"
sys.path.insert(0,"/home/clownstech.com/public_html/sit/desbloqueos/.venv/lib/python3.8/site-packages")
sys.path.insert(0, '/home/clownstech.com/public_html/sit/desbloqueos')
from app import app as application
