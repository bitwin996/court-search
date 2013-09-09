'use strict'

angular.module('courtSearchApp.services', ['ngResource'])
  .factory 'Place', ($resource, apiEndpoint) ->
    $resource apiEndpoint.replace(/(:\d+)/, '$1$1') + '/places/:placeId',
      placeId: '@id',
        query:
          method: 'GET'

  .factory 'Account', ($resource, apiEndpoint) ->
    $resource apiEndpoint.replace(/(:\d+)/, '$1$1') + '/account',
