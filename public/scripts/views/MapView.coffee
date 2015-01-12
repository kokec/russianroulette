define ['BackboneX', 'async!http://maps.google.com/maps/api/js?v=3.exp&sensor=false'], (BackboneView)->
    BackboneView.extend

        getConfig: ()->
            [
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

        _selectors: ()->
            map: '.map'

        initialize: ()->
            lat = new google.maps.LatLng(56.314323,43.999333)
            myOptions =
                zoom: 17
                center: lat
                mapTypeId: google.maps.MapTypeId.ROADMAP
                styles: @getConfig()
                disableDefaultUI: true
            image = '../images/marker.png'

            map = new google.maps.Map @el, myOptions
            new google.maps.Marker(
                position: lat
                map: map
                title: "RussianRoulette"
                icon: image
            )



