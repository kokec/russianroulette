require.config
    paths:
        'jquery': '../vendor/jquery/jquery.min'
        'underscore': '../vendor/underscore/underscore'
        'underscore.string': '../vendor/underscore.string/lib/underscore.string'
        'Backbone': '../vendor/backbone/backbone'
        'BackboneX': '../vendor/backbone.view/lib/Backbone.View.Elements'
        'waypoints': '../vendor/waypoints/waypoints.min'
        'json2': '../vendor/json2/json2'
        'masonry': '../vendor/masonry/dist/masonry.pkgd'
        'outlayer/outlayer': '../vendor/outlayer/outlayer'
        'outlayer/item': '../vendor/outlayer/item'
        'eventEmitter/EventEmitter': '../vendor/eventEmitter/EventEmitter'
        'matches-selector/matches-selector': '../vendor/matches-selector/matches-selector'
        'get-size/get-size': '../vendor/get-size/get-size'
        'get-style-property/get-style-property': '../vendor/get-style-property/get-style-property'
        'eventie/eventie': '../vendor/eventie/eventie'
        'doc-ready/doc-ready': '../vendor/doc-ready/doc-ready'
        'imagesLoaded': '../vendor/imagesloaded/imagesloaded'

    shim:
        'underscore':
            exports: '_'
        'underscore.string':
            deps: ['underscore']
        'Backbone':
            deps: ['jquery', 'underscore', 'json2']
            exports: 'Backbone'
        'masonry':
            deps: ['jquery']
            exports: 'Masonry'
        'waypoints':
            deps: ['jquery']


require ['app'], (app) ->
    app.start()
