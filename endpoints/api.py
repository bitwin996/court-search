#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
from google.appengine.ext import endpoints
from protorpc import remote,messages,message_types
from google.appengine.ext import ndb

#from models.place import Place,GetPlaceRequest,GetPlaceResponse,PostPlaceRequest,PostPlaceResponse
from models.place import DbPlace,Place,Places,PlaceQuery,PlaceSaved


# URL: /_ah/api/court-search/v1
@endpoints.api(name='court-search', version='v1', description='CourtSearch API')
class CourtSearchApi(remote.Service):

  # URL: /_ah/api/court-search/v1/places
  @endpoints.method(message_types.VoidMessage, Places, path='places', http_method='GET')
  def get_account(self, request):
    dbPlaces = DbPlace.query()
    places = []
    for dbPlace in dbPlaces:
      places.append(toMessage(dbPlace))

    return Places(places=places)

  # URL: /_ah/api/court-search/v1/places
  @endpoints.method(Place, PlaceSaved, path='places', http_method='POST')
  def post_account(self, request):
    dbPlace = DbPlace(
        name = request.name,
        location = ndb.GeoPt(request.latitude, request.longitude),
        address = request.address,
        phone = request.phone
        )
    key = dbPlace.put()
    #print(key.toString())

    return PlaceSaved(name = request.name)

def toMessage(dbPlace):
  msg = Place(
      name = dbPlace.name,
      latitude = dbPlace.location.lat,
      longitude = dbPlace.location.lon,
      address = dbPlace.address,
      phone = dbPlace.phone
      )
  return msg


app = endpoints.api_server([CourtSearchApi], restricted=False)

