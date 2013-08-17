'use strict'

describe 'Controller: PlaceListCtrl', () ->

  # load the controller's module
  beforeEach module 'courtSearchApp'

  PlaceListCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PlaceListCtrl = $controller 'PlaceListCtrl', {
      $scope: scope
    }

  it 'should attach a list of place to the scope', () ->
    expect(scope.places.length).toBe 3
