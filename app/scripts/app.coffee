'use strict'

angular.module('courtSearchApp', [
  'courtSearchApp.services'
  'ui.bootstrap'
  #'ui.map'
])
  .config ($httpProvider) ->
    delete $httpProvider.defaults.headers.common["X-Requested-With"]

  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/place-list.html'
        controller: 'PlaceListCtrl'
      .otherwise
        redirectTo: '/'

  .constant 'apiEndpoint', "http://localhost:8080/_ah/api/court-search/v1"
  #.constant 'apiEndpoint', "http://localhost\\:9000/data"
