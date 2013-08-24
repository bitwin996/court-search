'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http, apiEndpoint, Place) ->

    $scope.data = Place.query null, ->
      $scope.setMarkers()

    #$scope.onGoogleReady = ->
    #  angular.bootstrap angular.element("#map-canvas"), ['courtSearchApp']
    #  setMarkers()

    $scope.setMarkers = ->
      for place in $scope.data.places
        unless place.latLng
          place.latLng = new google.maps.LatLng place.latitude, place.longitude

        unless place.marker
          place.marker = new google.maps.Marker
            map: $scope.csMap
            position: place.latLng

    $scope.mapOptions =
      center: new google.maps.LatLng(35.784, -78.670)
      zoom: 15
      mapTypeId: google.maps.MapTypeId.ROADMAP

    $scope.setCenter = (place) ->
      $scope.csMap.setCenter place.latLng
