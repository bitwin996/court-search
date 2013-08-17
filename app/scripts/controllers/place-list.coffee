'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope) ->
    $scope.places = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ]
