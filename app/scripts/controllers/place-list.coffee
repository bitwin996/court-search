'use strict'

#endpoint = "http://localhost:9000/data/places.json"
#endpoint = "http://localhost:8080/_ah/api/court-search/v1/places"

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http, apiEndpoint) ->
    $http.get(apiEndpoint + '/places.json').success (data) ->
      $scope.places = data.places
