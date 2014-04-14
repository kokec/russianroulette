#/* global require, audiojs */
'use strict'

require.config
  urlArgs: "bust=" +  (new Date()).getTime()
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'
  paths:
    jquery: '../bower_components/jquery/dist/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    video: '../bower_components/videojs/dist/video-js/video'
    audio: '../bower_components/audiojs/audiojs/audio'

require [
  'backbone', 'video', 'audio'
], (Backbone, video, audio) ->
  Backbone.history.start()
  audiojs.events.ready(()->
    audiojs.createAll()
  )
