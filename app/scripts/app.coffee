'use strict'

angular.module('courtSearchApp', ['ui.bootstrap', 'ui.map'])
  .config ($httpProvider) ->
    delete $httpProvider.defaults.headers.common["X-Requested-With"]

  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/place-list.html'
        controller: 'PlaceListCtrl'
      .otherwise
        redirectTo: '/'

  .value 'apiEndpoint', "http://localhost:9000/data"
  #.value 'apiEndpoint', "http://localhost:8080/_ah/api/court-search/v1"
