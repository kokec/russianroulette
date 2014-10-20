define ['jquery', 'backbone', 'masonry', 'waypoints'], ($, Backbone, Masonry)->
    App =
        start: ()->
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

            #            $('.bg-image').bgImageScale(background: '#000', opacity: 0.2) if $('.bg-image')

            headerChanger = (()->
                docElem = document.documentElement
                header = $('header')
                didScroll = false
                changeHeaderOn = 100;

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

                #    init()
            )()

            $('#mep_0').waypoint (way)->
                if way == 'down'
                    $('.header').addClass 'header_shrinked_yes'
                else
                    $('.header').removeClass 'header_shrinked_yes'
            , offset: $('.header').height()

            $('#socials').waypoint (way)->
                if way == 'down'
                    $(this).addClass 'socials_shrinked_yes'
                    $('.header').addClass 'socials_shrinked_yes'
                else
                    $(this).removeClass 'socials_shrinked_yes'
                    $('.header').removeClass 'socials_shrinked_yes'
            , offset: $('.header').height()

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

            new Masonry $tiles[0],
                itemSelector: '.col'
                isResizable: true
                columnWidth: Math.floor(($tiles.width() / cols))

            $(window).resize(()->
                calculateCols()
                new Masonry $tiles[0],
                    itemSelector: '.col'
                    isResizable: false
                    isAnimated: false
                    columnWidth: Math.floor(($tiles.width() / cols))
            )

