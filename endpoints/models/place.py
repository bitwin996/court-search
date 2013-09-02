#!/usr/bin/env python

from protorpc import messages
from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop


class Place(messages.Message):
  key = messages.StringField(1, required=False)
  name = messages.StringField(2, required=True)
  latitude = messages.FloatField(3, required=True)
  longitude = messages.FloatField(4, required=True)
  address = messages.StringField(5, required=False)
  phone = messages.StringField(6, required=False)

class PlaceStore(ndb.Model):
  name = ndb.StringProperty(required=True)
  location = ndb.GeoPtProperty(required=True)
  address = ndb.StringProperty(required=False)
  phone = ndb.StringProperty(required=False)

  def toMessage(self):
    msg = Place(
        key = self.key.urlsafe(),
        name = self.name,
        latitude = self.location.lat,
        longitude = self.location.lon,
        address = self.address,
        phone = self.phone
        )
    return msg

class PlaceMessage(messages.Message):
  data = messages.MessageField(Place, 2)


class Places(messages.Message):
  places = messages.MessageField(Place, 1, repeated=True)

class PlacesStore(ndb.Model):
  places = msgprop.MessageProperty(Places,
      indexed_fields = ['places.name', 'places.latitude', 'places.longitude'])

class PlaceQuery(messages.Message):
  count = messages.IntegerField(1, required=False)
