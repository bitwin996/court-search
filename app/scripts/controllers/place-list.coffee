'use strict'

angular.module('courtSearchApp')
  .controller 'PlaceListCtrl', ($scope, $http, apiEndpoint, Place) ->

    $scope.infoWindow = new google.maps.InfoWindow content: ''

    $scope.data = Place.query null, ->
      for place in $scope.data.places
        # initialize
        place.latLng = new google.maps.LatLng place.latitude, place.longitude

        place.marker = new google.maps.Marker
          map: $scope.csMap
          position: place.latLng
          title: place.name

        google.maps.event.addListener place.marker, 'click', =>
          $scope.infoWindow.close()
          $scope.infoWindow.content = place.address
          $scope.infoWindow.open $scope.csMap, place.marker


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
            title: place.name

    $scope.mapOptions =
      center: new google.maps.LatLng(35.784, -78.670)
      zoom: 15
      mapTypeId: google.maps.MapTypeId.ROADMAP

    $scope.setCenter = (place) ->
      $scope.csMap.panTo place.latLng
      #$scope.selectPlace place

    $scope.selectPlace = (place) ->
      $scope.infoWindow.close()
      $scope.csMap.panTo place.latLng
      $scope.infoWindow.content = place.address
      $scope.infoWindow.open $scope.csMap, place.marker

