'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http, apiEndpoint) ->
    $http.get(apiEndpoint + '/places.json').success (data) ->
      $scope.places = data.places

    $scope.setCenter = (place) ->
      console.log place
