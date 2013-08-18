#!/usr/bin/env python

from google.appengine.ext import ndb
from protorpc import messages

class DbPlace(ndb.Model):
  name = ndb.StringProperty()
  location = ndb.GeoPtProperty()
  address = ndb.StringProperty()
  phone = ndb.StringProperty()

class Place(messages.Message):
  name = messages.StringField(1, required=True)
  latitude = messages.FloatField(2, required=True)
  longitude = messages.FloatField(3, required=True)
  address = messages.StringField(4, required=False)
  phone = messages.StringField(5, required=False)

class Places(messages.Message):
  places = messages.MessageField(Place, 1, repeated=True)

class PlaceQuery(messages.Message):
  count = messages.IntegerField(1, required=False)

class PlaceSaved(messages.Message):
  name = messages.StringField(1, required=False)

"""
class GetPlaceRequest(messages.Message):
  name = messages.StringField(1, required=False)

class GetPlaceResponse(messages.Message):
  name = messages.StringField(1)
  latitude = messages.FloatField(2)
  longitude = messages.FloatField(3)
  address = messages.StringField(4)
  phone = messages.StringField(5)

class PostPlaceRequest(messages.Message):
  name = messages.StringField(1, required=True)
  latitude = messages.FloatField(2, required=False)
  longitude = messages.FloatField(3, required=False)
  address = messages.StringField(4, required=False)
  phone = messages.StringField(5, required=False)

class PostPlaceResponse(messages.Message):
  code = messages.IntegerField(1)
"""
