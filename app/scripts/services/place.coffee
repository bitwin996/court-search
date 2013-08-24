'use strict'

angular.module('courtSearchApp.services', ['ngResource'])
  .factory 'Place', ($resource, apiEndpoint) ->
    $resource apiEndpoint.replace(/(:\d+)/, '$1$1') + '/places', {},
      query:
        method: 'GET'
