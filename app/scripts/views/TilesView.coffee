define ['Backbone', 'masonry', 'BackboneX'], (Backbone, Masonry)->
    TilesView = Backbone.View.extend
        _selectors: ()->
            column: '.col'

        _events:
            'resize window': @._onResize

        initialize: ()->
            cols = 3

            @._calculateCols()

            new Masonry @.$el[0],
                itemSelector: @._selector 'column'
                isResizable: true
                columnWidth: Math.floor((@.$el.width() / cols))

        _onResize: ()->
            @._calculateCols()
            new Masonry @.$el[0],
                itemSelector: @._selector 'column'
                isResizable: false
                isAnimated: false
                columnWidth: Math.floor((@.$el.width() / cols))


        _calculateCols: ()->
            if @.$el.width() <= 426
                cols = 2
            else
                cols = 3;
