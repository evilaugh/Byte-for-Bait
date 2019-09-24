from flask import *
import geocoder
import reverse_geocoder as rg
import folium
app = Flask(__name__)

title_data = ['null' , 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7']

data_entry = ['data_element1', 'data_element2', 'data_element3', 'data_element4']

f5 = [5000, 2000, 6000, 4000, 5000, 6000, 1000, 8000]

f7 = ['F7_Title1', 'F7_Title2', 'F7_Title3', 'F7_Title4', 'F7_Title5']

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


@app.route('/')
def homepage():
    return render_template('index.html' , data = title_data , f5 = f5 , f7 = f7 , data_entry = data_entry)

# @app.route('/world')
# def homepage():
#     return render_template('world-wind.html')

@app.route('/map')
# def index():
#     start_coords = (46.9540700, 142.7360300)
#     folium_map = folium.Map(location=start_coords, zoom_start=14)
#     # folium_map.save()
#     return render_template('folium.html', folium_map=folium_map)

def map():
    start_coords = [13.148, 77.611]
    folium_map = folium.Map(location=start_coords,zoom_start=14,
                        tiles='openstreetmap')
    tooltip = 'Danger Khatra !'
    name = geo_search(start_coords)
    # {{ name[0] }}
    folium.Marker(start_coords, popup= name, tooltip=tooltip).add_to(folium_map)
    # folium.Marker( location = start_coords , popup = "Danger !" ,  (fill_color='#43d9de', radius = 8) ).add_to(folium_map)
    folium_map.save('templates/map.html')
    return render_template('folium.html')
