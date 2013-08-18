'use strict'

angular.module('courtSearchApp', ['ui.bootstrap'])
  .config ($routeProvider) ->
    $routeProvider
      #.when '/',
      #  templateUrl: 'views/main.html'
      #  controller: 'MainCtrl'
      #.when '/place-list',
      .when '/',
        templateUrl: 'views/place-list.html'
        controller: 'PlaceListCtrl'
      .otherwise
        redirectTo: '/'
