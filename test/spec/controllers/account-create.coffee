'use strict'

describe 'Controller: AccountCreateCtrl', () ->

  # load the controller's module
  beforeEach module 'courtSearchApp'

  AccountCreateCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AccountCreateCtrl = $controller 'AccountCreateCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
