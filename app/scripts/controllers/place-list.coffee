'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http, apiEndpoint, Place) ->

    $scope.data = Place.query ->
      return unless $scope.data.places

      for place in $scope.data.places
        place.latLng = new google.maps.LatLng place.latitude, place.longitude

        place.marker = new google.maps.Marker
          map: $scope.appMap
          position: place.latLng
          title: place.name
          place: place

        google.maps.event.addListener place.marker, 'click', ->
          $scope.selectPlace @place


    $scope.appMap = new google.maps.Map document.getElementById('map-canvas'),
      center: new google.maps.LatLng 14.6359, 121.0755
      zoom: 12
      mapTypeId: google.maps.MapTypeId.ROADMAP

    google.maps.event.addListener $scope.appMap, 'click', ->
      $scope.infoWindow.close()

    $scope.infoWindow = new google.maps.InfoWindow()

    $scope.selectPlace = (place) ->
      $scope.infoWindow.close()

      $scope.infoWindow.setOptions
        content: place.address

      $scope.infoWindow.open $scope.appMap, place.marker
      $scope.appMap.panTo place.latLng


    ###
    $scope.pageInit = ->
      script = document.createElement 'script'
      script.type = 'text/javascript'
      script.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"
      document.body.appendChild script
    ###
