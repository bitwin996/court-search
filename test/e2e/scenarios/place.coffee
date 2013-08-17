'use strict'

describe 'angularjsGruntExampleApp app', ->
  beforeEach ->
    browser().navigateTo '/#place-list'

  describe 'Place list view', ->
    it 'should display the correct route', ->
      expect(browser().location().path()).toBe '/place-list'
