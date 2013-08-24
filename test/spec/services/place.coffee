'use strict'

describe 'Service: place', ->

  # load the service's module
  beforeEach module 'courtSearchApp'

  # instantiate service
  Place = {}
  beforeEach inject (_Place_) ->
    Place = _Place_

  #it 'should do something', ->
  # expect(!!Place).toBe true

  it 'should be defined', ->
    #expect(Place.someMethod()).toBe 42
    expect(Place).toBeDefined()
