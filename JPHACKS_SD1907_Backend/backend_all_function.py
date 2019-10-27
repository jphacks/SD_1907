import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
import requests
import json
import pickle
# firebase cetrificate info
cred = credentials.Certificate('/home/ubuntu/JPHACKS/JP/<unique address>.json')
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://jphacks-2cd97.firebaseio.com/',
    'databaseAuthVariableOverride': {
        'uid': 'my-service-worker'
    }
})
# end

# 1:Get Request DB
ref = db.reference('/req')
req_data = ref.get()
#complete recieve request

# # 2.AIRPORT/AIRCRAFT info(depart)
# with open('flight_info_departure.pickle', 'rb') as depart:
#     flightinfo_depart = pickle.load(depart)
          

# # 2.1.AIRPORT/AIRCRAFT info(arrive)
# with open('flight_info_arrival.pickle', 'rb') as arrive:
#     flightinfo_arrive = pickle.load(arrive)
#     json_arrive = json.dumps(flightinfo_arrive)

place = req_data["dep_place"]
air = open("code_latlon.json", "r") 
airjson = json.load(air)

# 1:Rakuten travel API
country_temp = "japan"
pref_temp = "chiba"
small_temp = "narita"
api = "https://app.rakuten.co.jp/services/api/Travel/SimpleHotelSearch/20170426?format=json&applicationId=<APP key>&format=xml&largeClassCode={country}&middleClassCode={pref}&smallClassCode={small}&datumType=1"
# API using request parameter"Country","Prefecture","City"
url = api.format(country = country_temp, pref = pref_temp, small = small_temp)

req_rakuten = requests.get(url)
rakutenjson = json.loads(req_rakuten.text)

#define DBname&insert firebase
result_ref = db.reference('/resultdata')
result_ref.set(
    {
        "data1": {
             "req_ID" : "1",
             "hotelname" : rakutenjson["hotels"][0]["hotel"][0]["hotelBasicInfo"]["hotelName"],
             "hotel_latitude":rakutenjson["hotels"][0]["hotel"][0]["hotelBasicInfo"]["latitude"],
             "hotel_longtitude" : rakutenjson["hotels"][0]["hotel"][0]["hotelBasicInfo"]["longitude"],
             "hotel_review_num" : rakutenjson["hotels"][0]["hotel"][0]["hotelBasicInfo"]["reviewCount"],
             "hotel_review_rate" : rakutenjson["hotels"][0]["hotel"][0]["hotelBasicInfo"]["reviewAverage"],
             "hotel_detail" : rakutenjson["hotels"][0]["hotel"][0]["hotelBasicInfo"]["hotelInformationUrl"],
             "hotel_image" : rakutenjson["hotels"][0]["hotel"][0]["hotelBasicInfo"]["hotelImageUrl"],
             "AirPortname": req_data["dep_place"],
             "Airport_latitude":airjson[place][0],
             "Airport_longtitude" : airjson[place][1],
             "ForwardAir_ticket_price": "30000",
             "ForwardAir_depart_time" : "12:31",
             "ForwardAir_arrive_time" : "14:50",
             "ReturnAir_ticket_price1" : "43220",
             "ReturnAir_ticket_price2" : "65900",
             "ReturnAir_ticket_price3" : "92000",
             "ReturnAir_candidate_1" : "JL9114",
             "ReturnAir_candidate_2" : "JL9134",
             "ReturnAir_candidate_3" : "JR2834",
             "ReturnAir_depart_time1" : "20:01",
             "ReturnAir_arrive_time1" : "23:56",
             "ReturnAir_depart_time2" : "11:09",
             "ReturnAir_arrive_time2" : "13:40",
             "ReturnAir_depart_time3" : "15:07",
             "ReturnAir_arrive_time3" : "17:52",
 }
   })
result_ref.set({
    "data2" : {
             "req_ID" : "2",
             "hotelname" : rakutenjson["hotels"][1]["hotel"][0]["hotelBasicInfo"]["hotelName"],
             "hotel_latitude":rakutenjson["hotels"][1]["hotel"][0]["hotelBasicInfo"]["latitude"],
             "hotel_longtitude" : rakutenjson["hotels"][1]["hotel"][0]["hotelBasicInfo"]["longitude"],
             "hotel_review_num" : rakutenjson["hotels"][1]["hotel"][0]["hotelBasicInfo"]["reviewCount"],
             "hotel_review_rate" : rakutenjson["hotels"][1]["hotel"][0]["hotelBasicInfo"]["reviewAverage"],
             "hotel_detail" : rakutenjson["hotels"][1]["hotel"][0]["hotelBasicInfo"]["hotelInformationUrl"],
             "hotel_image" : rakutenjson["hotels"][1]["hotel"][0]["hotelBasicInfo"]["hotelImageUrl"],
             "AirPortname": req_data["dep_place"],
             "Airport_latitude":airjson[place][0],
             "Airport_longtitude" : airjson[place][1],
             "ForwardAir_ticket_price": "30000",
             "ForwardAir_depart_time" : "12:31",
             "ForwardAir_arrive_time" : "14:50",
             "ReturnAir_ticket_price1" : "43220",
             "ReturnAir_ticket_price2" : "65900",
             "ReturnAir_ticket_price3" : "92000",
             "ReturnAir_candidate_1" : "JL9114",
             "ReturnAir_candidate_2" : "JL9134",
             "ReturnAir_candidate_3" : "JR2834",
             "ReturnAir_depart_time1" : "20:01",
             "ReturnAir_arrive_time1" : "23:56",
             "ReturnAir_depart_time2" : "11:09",
             "ReturnAir_arrive_time2" : "13:40",
             "ReturnAir_depart_time3" : "15:07",
             "ReturnAir_arrive_time3" : "17:52",
   }})
result_ref.set({
    "data3" : {
             "req_ID" : "3",
             "hotelname" : rakutenjson["hotels"][2]["hotel"][0]["hotelBasicInfo"]["hotelName"],
             "hotel_latitude":rakutenjson["hotels"][2]["hotel"][0]["hotelBasicInfo"]["latitude"],
             "hotel_longtitude" : rakutenjson["hotels"][2]["hotel"][0]["hotelBasicInfo"]["longitude"],
             "hotel_review_num" : rakutenjson["hotels"][2]["hotel"][0]["hotelBasicInfo"]["reviewCount"],
             "hotel_review_rate" : rakutenjson["hotels"][2]["hotel"][0]["hotelBasicInfo"]["reviewAverage"],
             "hotel_detail" : rakutenjson["hotels"][2]["hotel"][0]["hotelBasicInfo"]["hotelInformationUrl"],
             "hotel_image" : rakutenjson["hotels"][2]["hotel"][0]["hotelBasicInfo"]["hotelImageUrl"],
             "AirPortname": req_data["dep_place"],
             "Airport_latitude":airjson[place][0],
             "Airport_longtitude" : airjson[place][1],
             "ForwardAir_ticket_price": "30000",
             "ForwardAir_depart_time" : "12:31",
             "ForwardAir_arrive_time" : "14:50",
             "ReturnAir_ticket_price1" : "43220",
             "ReturnAir_ticket_price2" : "65900",
             "ReturnAir_ticket_price3" : "92000",
             "ReturnAir_candidate_1" : "JL9114",
             "ReturnAir_candidate_2" : "JL9134",
             "ReturnAir_candidate_3" : "JR2834",
             "ReturnAir_depart_time1" : "20:01",
             "ReturnAir_arrive_time1" : "23:56",
             "ReturnAir_depart_time2" : "11:09",
             "ReturnAir_arrive_time2" : "13:40",
             "ReturnAir_depart_time3" : "15:07",
             "ReturnAir_arrive_time3" : "17:52",
   }
   })


#Loop Message
print("ループ完了")
