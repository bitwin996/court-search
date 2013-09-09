'use strict'

angular.module('courtSearchApp')
  .controller 'AccountCreateCtrl', ($scope, Account) ->
    $scope.account = Account.get()

    $scope.submit = ->
      account = new Account $scope.account
      account.$save (data) ->
        $scope.account = data



