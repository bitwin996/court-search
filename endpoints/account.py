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

from models.account import AccountStore,Account


# URL: /_ah/api/account/v1
@endpoints.api(name='account', version='v1', description='Account API')
class AccountApi(remote.Service):

  # URL: /_ah/api/account/v1
  @endpoints.method(Account, Account, path='/', http_method='GET')
  def get_account(self, request):
    account = Account(
      name = "test"
      email = "test@test.com"
      )

    return account

  # URL: /_ah/api/account/v1
  @endpoints.method(Account, Account, path='/', http_method='POST')
  def post_account(self, request):
    store = AccountStore(
      name = request.name,
      email = request.email
      )

    return 'a'

    if not mail.is_email_valid(store.email):
      return 1

    msg = mail.EmailMessage()
    msg.sender = 'info@haletto.jp'
    msg.to = store.email

    key = store.put()

    msg.send()

    return store.toMessage()


app = endpoints.api_server([AccountApi], restricted=False)
