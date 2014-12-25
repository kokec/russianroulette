define ['BackboneX', 'waypoints'], (BackboneView)->
    BackboneView.extend
        _selectors: ()->
            wpHeader: '#wpHeader'
            wpSocials: '#wpSocials'

        _classes: ()->
            shrinkedHeader: 'header_shrinked_yes'
            shrinkedSocials: 'socials_shrinked_yes'

        initialize: ()->
            self = @
            @._$body.find(@._selector('wpHeader')).waypoint (way)->
                if way == 'down'
                    self.$el.addClass self._class('shrinkedHeader')
                else
                    self.$el.removeClass self._class('shrinkedHeader')
            , offset: self.$el.height()

            @._$body.find(@._selector('wpSocials')).waypoint (way)->
                if way == 'down'
                    $(this).addClass self._class('shrinkedSocials')
                    self.$el.addClass self._class('shrinkedSocials')
                else
                    $(this).removeClass self._class('shrinkedSocials')
                    self.$el.removeClass self._class('shrinkedSocials')
            , offset: self.$el.height()
