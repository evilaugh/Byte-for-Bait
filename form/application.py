from flask import Flask, session,render_template,request
import geocoder
import requests
from flask import jsonify

import os

app = Flask(__name__)


        
@app.route("/",methods=["GET","POST"])
def index():
        return render_template('profile.html')

@app.route("/get_my_ip", methods=["GET"])
def get_my_ip():
    return jsonify({'ip': request.remote_addr}), 200
  
   
if __name__ == "__main__":
    app.run()