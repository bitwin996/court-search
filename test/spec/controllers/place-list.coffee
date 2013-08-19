'use strict'

describe 'Controller: PlaceListCtrl', () ->

  # load the controller's module
  beforeEach module 'courtSearchApp'

  PlaceListCtrl = {}
  scope = {}
  httpBackend = {}

  placesData = [
    name: "Place A"
  ,
    name: "Place B"
  ]

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope, apiEndpoint) ->
    httpBackend = _$httpBackend_
    httpBackend.expectGET(apiEndpoint + '/places.json').respond placesData

    scope = $rootScope.$new()
    PlaceListCtrl = $controller 'PlaceListCtrl', $scope: scope

  it "should create 'places' model with 2 places fetched from xhr", ->
      expect(scope.places).toBeUndefined()
      httpBackend.flush()
      expect(scope.places).toEqual placesData
