define ['BackboneX', 'masonry', 'imagesLoaded'], (BackboneView, Masonry, ImagesLoaded)->
    BackboneView.extend
        _selectors: ()->
            column: '.col'

        _classes: ()->
            shown: 'shown'

        initialize: ()->

            ImagesLoaded @.$el[0], ()=>
                new Masonry @.$el[0],
                    itemSelector: @._selector 'column'
                    transitionDuration: 0

                @._elem('column').each (i, el)=>
                    $(el).addClass @_class('shown')


