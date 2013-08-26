'use strict'

#jasmine.Matchers.prototype.toEqualData = (expected) ->
#  angular.equals @actual, expected

describe 'Controller: PlaceNewCtrl', () ->

  # load the controller's module
  beforeEach module 'courtSearchApp'

  PlaceNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    #for k,v of @
    #  console.log k,v
    scope = $rootScope.$new()
    PlaceNewCtrl = $controller 'PlaceNewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toEqualData 5
