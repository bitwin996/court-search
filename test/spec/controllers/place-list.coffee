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
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    httpBackend = _$httpBackend_
    httpBackend.expectGET('data/places.json').respond placesData

    scope = $rootScope.$new()
    PlaceListCtrl = $controller 'PlaceListCtrl', $scope: scope

  #it 'should attach a list of place to the scope', () ->
  #  expect(scope.places.length).toBe 3


  it "should create 'places' model with 2 places fetched from xhr", ->
      expect(scope.places).toBeUndefined()
      httpBackend.flush()
      expect(scope.places).toEqual placesData
