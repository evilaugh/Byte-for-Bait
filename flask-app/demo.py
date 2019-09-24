l_d = [{'name': 'Yelahanka', 'cc': 'IN', 'lon': '77.59626', 'admin1': 'Karnataka', 'admin2': 'Bangalore Urban', 'lat': '13.10129'}]


def name_from_listdict(ld):
    name = l_d[0]['name'] + " " + l_d[0]['admin2'] + " " + l_d[0]['admin1']
    return name
name = name_from_listdict(l_d)
print(name)
