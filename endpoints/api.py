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

from pprint import pprint
from inspect import getmembers

from models.place import PlaceStore,Place,Places
from models.account import AccountStore,Account


# URL: /_ah/api/court-search/v1
@endpoints.api(name='court-search', version='v1', description='CourtSearch API')
class CourtSearchApi(remote.Service):

  # URL: /_ah/api/court-search/v1/places
  @endpoints.method(message_types.VoidMessage, Places, path='places', http_method='GET')
  def get_places(self, request):
    stores = PlaceStore.query().fetch()
    places = [store.toMessage() for store in stores]

    return Places(places = places)

  # URL: /_ah/api/court-search/v1/places
  @endpoints.method(Place, Place, path='places', http_method='POST')
  def post_place(self, request):
    store = PlaceStore(
      name = request.name,
      location = ndb.GeoPt(request.latitude, request.longitude),
      address = request.address,
      phone = request.phone
      )
    key = store.put()

    return store.toMessage()

  # URL: /_ah/api/court-search/v1/places
  @endpoints.method(message_types.VoidMessage, message_types.VoidMessage, path='places', http_method='OPTIONS')
  def options_places(self, request):
    methods = ['GET', 'POST']
    #request.response.headers.add_header('Allow', ','.join(methods))

  # URL: /_ah/api/court-search/v1/account
  @endpoints.method(Account, Account, path='account', http_method='GET')
  def get_account(self, request):
    key = 'aaaa'
    account = Account(
      id = key,
      name = 'test user',
      email = 'test@gmail.com'
      )
    return account


  # URL: /_ah/api/court-search/v1/account
  @endpoints.method(Account, Account, path='account', http_method='POST')
  def post_account(self, request):
    store = AccountStore(
      name = request.name,
      email = request.email
      )

    #if not mail.is_email_valid(store.email):
    #  return 1

    #msg = mail.EmailMessage()
    #msg.sender = 'test@cs.jp'
    #msg.to = store.email

    key = store.put()

    #msg.send()

    return store.toMessage()


app = endpoints.api_server([CourtSearchApi], restricted=False)
