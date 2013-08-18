'use strict'

describe 'angularjsGruntExampleApp app', ->
  beforeEach ->
    browser().navigateTo '/'

  describe 'Place list view', ->
    it 'should display the correct route', ->
      expect(browser().location().path()).toBe '/'
