#import part

from flask import *
import numpy as np
import os
import sys
import geocoder
import reverse_geocoder as rg
import requests
from flask import jsonify
# import matplotlib.pyplot as plt
import pandas as pd
import folium
from folium import FeatureGroup, LayerControl, Map, Marker
from folium.plugins import MarkerCluster
from folium import plugins
from sklearn.cluster import KMeans

app = Flask(__name__)


#data part

title_data = ['null' , 'F1', 'F2', 'F3', 'F4', 'Number of Trees Burned Over The Year', 'User Reports vs Validation', 'F7']

data_entry = ['data_element1', 'data_element2', 'data_element3', 'data_element4']

f5 = [2728, 823, 1621, 1863, 2483, 2975, 3495, 4247 , 6741 , 5248 , 4639 , 3146]

f7 = ['F7_Title1', 'F7_Title2', 'F7_Title3', 'F7_Title4', 'F7_Title5']

start_coords = [13.148, 77.611]

circle = [87.475 , 5.273, 7.252]


#custom defined functions




def name_from_listdict(ld):
    name = ld[0]['name'] + " " + ld[0]['admin2'] + " " + ld[0]['admin1']
    return name

def geo_search(coordinates):
    result = rg.search(coordinates)
    name = name_from_listdict(result)

    print(result)
    return name
    # return name


# name = name_from_listdict(l_d)




#webpage part

@app.route('/')
def index():
    return render_template('index.html' , data = title_data , f5 = f5 , f7 = f7 , data_entry = data_entry , circle = circle)





@app.route('/form')
def form():
    return render_template('profile.html')

@app.route('/d3js1')
def d3js1():
    return render_template('d3js1.html')

@app.route("/get_my_ip", methods=["GET"])
def get_my_ip():
    return jsonify({'ip': request.remote_addr}), 200




@app.route('/map')
def map():
    return render_template('osm4.html')
