"use strict";

var path = require('path');

module.exports = {
    index: function (req, res) {
        res.render('main', {pageIndex: true});
    },

    contacts: function (req, res) {
        res.sendfile(path.join(req.app.get('public') + '/contacts.html'));
    }
};
