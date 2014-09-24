$ = jQuery

$(document).ready ()->
  $(".fadeIn").each(()->
    src = $(this).data("src")
    if src
      img = new Image()
      img.style.display = "none"
      img.onload = ()->
        $(this).fadeIn(1000)

      $(this).append(img)
      img.src = src
  )

  $('video').mediaelementplayer(
    defaultVideoWidth:  480
    defaultVideoHeight: 270
  )
  myPlaylist = [
    {
      mp3:    'media/BME/01-Royce Da 5′9″ Ft. Eminem - Welcome 2 Hell (Prod. by Havoc).mp3'
      title:  'Welcome 2 Hell (Prod. by Havoc)'
      artist: 'Royce Da 5′9″ Ft. Eminem'
    }
    {
      mp3:    'media/BME/02-Royce Da 5′9″ Ft. Eminem - Fastlane (Prod. by Supa Dups).mp3'
      title:  'Fastlane (Prod. by Supa Dups)'
      artist: 'Royce Da 5′9″ Ft. Eminem'
    }
  ]

  if $('.player').length
    $('.player').ttwMusicPlayer myPlaylist,
      autoPlay: false
      jPlayer:
                swfPath: '../plugin/jquery-jplayer'

  $('.bg-image').bgImageScale(background: '#000', opacity: 0.2) if $('.bg-image')

  headerChanger = (()->
    docElem = document.documentElement
    header = $('header')
    didScroll = false
    changeHeaderOn = 300;

    init = () ->
      window.addEventListener 'scroll', (e)->
        if !didScroll
          didScroll = true;
          setTimeout scrollPage, 250
      false

    scrollPage = () ->
      sy = scrollY()
      if sy >= changeHeaderOn
        header.addClass 'header_shrinked_yes'
      else
        header.removeClass 'header_shrinked_yes'
      didScroll = false;

    scrollY = () ->
      window.pageYOffset || docElem.scrollTop

    init()
  )()
#grid
#	/ * init * /
cols = 3
$tiles = $('.tiles')

calculateCols = ()->
  if $tiles.width() <= 426
    cols = 2
  else
    cols = 3;

calculateCols()

$tiles.masonry(
  itemSelector: '.col'
  isResizable:  true
  columnWidth:  Math.floor(($tiles.width() / cols))
)

$(window).resize(()->
  calculateCols()
  $tiles.masonry(
    itemSelector: '.col'
    isResizable:  false
    isAnimated:   false
    columnWidth:  Math.floor(($tiles.width() / cols))
  )
)


styles = [
  {
    "featureType": "landscape"
    "stylers":     [
      "saturation": -100
      "lightness":  65
      "visibility": "on"
    ]
  }
  {
    "featureType": "poi"
    "stylers":     [
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
    "stylers":     [
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
    "stylers":     [
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
    "stylers":     [
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
    "stylers":     [
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
    "stylers":     [
      {
        "visibility": "off"
      }
    ]
  }
  {
    "featureType": "water"
    "elementType": "labels"
    "stylers":     [
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
    "stylers":     [
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
    zoom:             15
    center:           lat
    mapTypeId:        google.maps.MapTypeId.ROADMAP
    styles:           styles
    disableDefaultUI: true
  image = '../images/marker.png'

  map = new google.maps.Map($('.map')[0], myOptions)
  new google.maps.Marker(
    position: lat
    map:      map
    title:    "Hello World!"
    icon:     image
  )

if $('.map').length
  google.maps.event.addDomListener(window, 'load', initialize)