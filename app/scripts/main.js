require.config({
    paths: {
        jquery:              '../vendor/jquery/jquery',
        waypoints:           '../vendor/waypoints/waypoints.js'
    },
    shim:  {
        waypoints:  {
            deps: ['jquery']
        }
    }
});

require(['app', 'jquery'], function (app, $) {
    'use strict';
    // use app here
    console.log(app);
    console.log('Running jQuery %s', $().jquery);
});
