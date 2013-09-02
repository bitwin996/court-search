'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceNewCtrl', ($scope, Place) ->
    $scope.data = Place.get()
    $scope.place = {}

    $scope.submit = ->
      place = new Place $scope.place
      result = place.$save()
      console.log result, place.id

