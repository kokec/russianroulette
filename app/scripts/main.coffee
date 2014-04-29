$ = jQuery

$(document).ready ()->
  $('.bg-image').bgImageScale(background: '#000', opacity: 0.8) if $('.bg-image')

  $('video').mediaelementplayer(
    defaultVideoWidth: 480
    defaultVideoHeight: 270
  )

  animation = ()->
    $('.mejs-container').animate({
      opacity: 1
      top: '100px'
    }, 1000)
  setTimeout(animation, 1000)


