'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceNewCtrl', ($scope, Place) ->
    $scope.place = Place.get {placeId: @id}
    #$scope.place = {}

    $scope.submit = ->
      #console.log $scope.data
      place = new Place $scope.place
      result = place.$save()
      console.log $scope.place, place


