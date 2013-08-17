'use strict'

angular.module('courtSearchApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/place-list',
        templateUrl: 'views/place-list.html'
        controller: 'PlaceListCtrl'
      .otherwise
        redirectTo: '/'
