define ['BackboneX'], (BackboneView)->
    BackboneView.extend
        initialize: ()->
            @._initImage()

        _initImage: ()->
            src = @.$el.data("src")
            if src
                img = new Image()
                img.style.display = "none"
                img.onload = ()->
                    $(@).fadeIn(1000)

                img.src = src
                @.$el.prepend img
