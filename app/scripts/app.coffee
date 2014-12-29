define ['jquery', 'views/FadeableImageView', 'views/HeaderView', 'views/TilesView', 'views/MapView', 'bgImageScale'],
    ($, FadeableImageView, HeaderView, TilesView, MapView)->
        App =
            start: ()->
                @._initBackground()
                @._initFadeableImages()
                @._initHeader()
                @._initTiles()
                @._initMap()

            _initBackground: ()->
                $('.bg-image').bgImageScale(background: '#000', opacity: 0.2) if $('.bg-image')

            _initHeader: ()->
                new HeaderView
                    el: $('.header')

            _initTiles: ()->
                if $('.tiles').length
                    new TilesView
                        el: $('.tiles')

            _initMap: ()->
                if $('.map').length
                    new MapView
                        el: $('.map')

            _initFadeableImages: ->
                $(".fadeIn").each ()->
                    new FadeableImageView
                        el: $(@)

#            $('video').mediaelementplayer(
#                defaultVideoWidth: 480
#                defaultVideoHeight: 270
#            )
#            myPlaylist = [
#                {
#                    mp3: 'media/BME/01-Royce Da 5′9″ Ft. Eminem - Welcome 2 Hell (Prod. by Havoc).mp3'
#                    title: 'Welcome 2 Hell (Prod. by Havoc)'
#                    artist: 'Royce Da 5′9″ Ft. Eminem'
#                }
#                {
#                    mp3: 'media/BME/02-Royce Da 5′9″ Ft. Eminem - Fastlane (Prod. by Supa Dups).mp3'
#                    title: 'Fastlane (Prod. by Supa Dups)'
#                    artist: 'Royce Da 5′9″ Ft. Eminem'
#                }
#            ]
#
#            if $('.player').length
#                $('.player').ttwMusicPlayer myPlaylist,
#                    autoPlay: false
#                    jPlayer:
#                        swfPath: '../plugin/jquery-jplayer'

#
