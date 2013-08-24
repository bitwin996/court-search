'use strict'

describe 'Controller: PlaceListCtrl', () ->
  beforeEach ->
    @addMatchers
      toEqualData: (expected) ->
        angular.equals @actual, expected

  # load the controller's module
  beforeEach module 'courtSearchApp'

  PlaceListCtrl = {}
  scope = {}
  httpBackend = {}

  placesData = places: [
    name: "Place A"
  ,
    name: "Place B"
  ]

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope, apiEndpoint) ->
    httpBackend = _$httpBackend_
    httpBackend.expectGET(apiEndpoint + '/places').respond places: placesData

    scope = $rootScope.$new()
    PlaceListCtrl = $controller 'PlaceListCtrl', $scope: scope

  xit "should create 'places' model with 2 places fetched from xhr", ->
    expect(scope.places).toBeUndefined()
    httpBackend.flush()
    expect(scope.places).toEqual placesData
