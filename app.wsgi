import sys 
import os
os.environ['APP_SETTINGS_MODULE'] = 'config.prod'
os.environ['SECRET_KEY'] = r"pl288au3t5(8y%997(a2e_tj8hlkyff^^8l@_7t&hr29j^!^#&"
os.environ['BD_USER'] =  "enrollFun"
os.environ['BD_NAME'] =  "enrollFun"
os.environ['BD_PASSWORD'] =  r"zr10Jiraim.7UHz"
os.environ['DOMAIN_FOLDER'] = "/home/oxford/public_html/enrollfun"
os.environ['HOST'] = "https://oxfordaltagracia.com.ar/enrollfun"
os.environ['MAIL_USERNAME'] = 'noresponder@oxfordaltagracia.com.ar'
os.environ['MAIL_PASSWORD'] = 'ECtJhwX2RVID7rm'
sys.path.insert(0,"/home/oxford/public_html/api/.venv/lib/python3.8/site-packages")
sys.path.insert(0, '/home/oxford/public_html/api')
from app import app as application
