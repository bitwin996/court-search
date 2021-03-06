'use strict'

angular.module('courtSearchApp.services', ['ngResource'])
  .service 'Place', ($resource, apiEndpoint) ->
    $resource apiEndpoint.replace(/(:\d+)/, '$1$1') + '/places/:placeId',
      placeId: '@id',
        query:
          method: 'GET'

###
        get:
          method: 'GET'
          params:
            placeId: '@id'
###
