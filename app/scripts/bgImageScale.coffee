$ = jQuery

$.fn.bgImageScale = (options) ->
  defaults =
    opacity: 0.4
    usePattern: true
    background: '#ff5500'
    delay: 100
    minWidth: 600
    overlayClass: 'bg-image-overlay'
    callback: ()->

  options = $.extend {}, defaults, options

  selector = $(@).find('img')

  selector.parent().css background: options.background

  if !!options.usePattern
    selector.parent().append '<div id="' + options.overlayClass + '"></div>'

  $window = $(window)

  resize = ()->
    winWidth = $window.width()
    winHeight = $window.height()
    winRatio = winHeight / winWidth
    imgWidth = selector.width()
    imgHeight = selector.height()
    imgRatio = imgHeight / imgWidth

    if winRatio > imgRatio
      imgHeight = winHeight
      imgWidth = winHeight / imgRatio
    else
      imgHeight = winWidth * imgRatio
      imgWidth = winWidth

    selector.css width: imgWidth + 'px', height: imgHeight + 'px', left: (winWidth - imgWidth) / 2 + 'px'

  $window.bind 'resize', resize

  selector.each (index, el)->
    img = new Image()
    path = $(el).attr 'src'
    onLoad = ()->
      resize()
      selector
        .css(opacity: 0, display: 'block')
        .delay(options.delay)
        .animate(opacity: options.opacity)

    $(img).load(onLoad)
    .attr('src', path)
    .error () ->
      console.error('image path error')

