'use strict'

angular.module('courtSearchApp', ['ui.bootstrap', 'ui.map'])
#angular.module('courtSearchApp', ['ui.bootstrap'])
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

  .config ($httpProvider) ->
    delete $httpProvider.defaults.headers.common["X-Requested-With"]

  .value 'apiEndpoint', "http://localhost:9000/data"
  #.value 'apiEndpoint', "http://localhost:8080/_ah/api/court-search/v1"
