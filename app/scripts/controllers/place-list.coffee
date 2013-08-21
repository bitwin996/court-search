'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http, apiEndpoint) ->
    $http.get(apiEndpoint + '/places.json').success (data) ->
      $scope.places = data.places

      #$scope.mapCtrl = angular.module('courtSearchApp').controller 'MapCtrl'

    $scope.setCenter = (place) ->
      console.log place
