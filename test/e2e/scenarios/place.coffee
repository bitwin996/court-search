'use strict'

describe 'angularjsGruntExampleApp app', ->

  describe 'Routing', ->

    xit 'should display default route', ->
      browser().navigateTo '/'
      expect(browser().location().path()).toBe '/place-list'

    describe 'Place list view', ->
      beforeEach ->
        browser().navigateTo '/place-list'

      it 'should display the correct route', ->
        expect(browser().location().path()).toBe '/place-list'


    describe 'Place create view', ->
      beforeEach ->
        browser().navigateTo '#/place-new'

      it 'should display the correct route', ->
        expect(browser().location().path()).toBe '/place-new'
