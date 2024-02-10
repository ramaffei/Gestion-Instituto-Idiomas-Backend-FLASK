import sys 
import os
os.environ['APP_SETTINGS_MODULE'] =  'config.prod'
os.environ['BD_USER'] =  "oxford"
os.environ['BD_NAME'] =  "enrollFun"
os.environ['BD_PASSWORD'] =  "8VelRaIEza9DCnj"
os.environ['MAIL_USERNAME'] = 'noresponder@oxfordaltagracia.com.ar'
os.envieron['MAIL_PASSWORD'] = 'ECtJhwX2RVID7rm'
sys.path.insert(0,"/home/clownstech.com/public_html/sit/desbloqueos/.venv/lib/python3.8/site-packages")
sys.path.insert(0, '/home/clownstech.com/public_html/sit/desbloqueos')
from app import app as application
