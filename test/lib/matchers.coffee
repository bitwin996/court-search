'use strict'

jasmine.Matchers.prototype.toEqualData = (expected) ->
  angular.equals @actual, expected

