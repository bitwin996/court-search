'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceNewCtrl', ($scope, Place) ->
    $scope.place = Place.get {placeId: @id}

    $scope.submit = ->
      place = new Place $scope.place
      place.$save (place) ->
        $scope.place = place



