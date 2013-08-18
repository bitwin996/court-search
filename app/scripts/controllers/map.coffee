'use strict'

angular.module('courtSearchApp')
  .controller 'MapCtrl', ($scope) ->
    $scope.mapOptions =
      center: new google.maps.LatLng(35.784, -78.670)
      zoom: 15
      mapTypeId: google.maps.MapTypeId.ROADMAP
