
styles = [
    {
        "featureType": "landscape"
        "stylers": [
            "saturation": -100
            "lightness": 65
            "visibility": "on"
        ]
    }
    {
        "featureType": "poi"
        "stylers": [
            {
                "saturation": -100
            }
            {
                "lightness": 51
            }
            {
                "visibility": "simplified"
            }
        ]
    }
    {
        "featureType": "road.highway"
        "stylers": [
            {
                "saturation": -100
            }
            {
                "visibility": "simplified"
            }
        ]
    }
    {
        "featureType": "road.arterial"
        "stylers": [
            {
                "saturation": -100
            }
            {
                "lightness": 30
            }
            {
                "visibility": "on"
            }
        ]
    }
    {
        "featureType": "road.local"
        "stylers": [
            {
                "saturation": -100
            }
            {
                "lightness": 40
            }
            {
                "visibility": "on"
            }
        ]
    }
    {
        "featureType": "transit"
        "stylers": [
            {
                "saturation": -100
            }
            {
                "visibility": "simplified"
            }
        ]
    }
    {
        "featureType": "administrative.province"
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    }
    {
        "featureType": "water"
        "elementType": "labels"
        "stylers": [
            {
                "visibility": "on"
            }
            {
                "lightness": -25
            }
            {
                "saturation": -100
            }
        ]
    }
    {
        "featureType": "water"
        "elementType": "geometry"
        "stylers": [
            {
                "hue": "#ffff00"
            }
            {
                "lightness": -25
            }
            {
                "saturation": -97
            }
        ]
    }
]

initialize = ()->
    lat = new google.maps.LatLng(56.2890245, 43.9118107)
    myOptions =
        zoom: 15
        center: lat
        mapTypeId: google.maps.MapTypeId.ROADMAP
        styles: styles
        disableDefaultUI: true
    image = '../images/marker.png'

    map = new google.maps.Map($('.map')[0], myOptions)
    new google.maps.Marker(
        position: lat
        map: map
        title: "Hello World!"
        icon: image
    )

if $('.map').length
    google.maps.event.addDomListener(window, 'load', initialize)
