'use strict'

endpoint = "http://localhost:9000/"

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http) ->
    $http.get(endpoint + 'data/places.json').success (data) ->
      $scope.places = data
