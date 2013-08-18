'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http) ->
    $http.get('data/places.json').success (data) ->
      $scope.places = data
    ###
    $scope.places = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ]
    ###
