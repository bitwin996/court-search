'use strict'

angular.module('courtSearchApp.services', ['ngResource'])
  .service 'Account', ($resource, apiEndpoint) ->
    $resource apiEndpoint.replace(/(:\d+)/, '$1$1') + '/account',
