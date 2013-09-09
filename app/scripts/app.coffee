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
      .when '/place-list',
        templateUrl: 'views/place-list.html'
        controller: 'PlaceListCtrl'
      .when '/place-new',
        templateUrl: 'views/place-new.html'
        controller: 'PlaceNewCtrl'
      .when '/account-create',
        templateUrl: 'views/account-create.html'
        controller: 'AccountCreateCtrl'
      .otherwise
        redirectTo: '/place-list'

  .constant 'apiEndpoint', "http://localhost:8080/_ah/api/court-search/v1"
  #.constant 'apiEndpoint', "http://localhost\\:9000/data"
