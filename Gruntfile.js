// Generated on 2014-04-15 using generator-webpublic-rjs 0.4.8
'use strict';

// # Globbing
// for performance reasons we're only matching one level down:
// 'test/spec/{,*/}*.js'
// use this if you want to recursively match all subfolders:
// 'test/spec/**/*.js'

module.exports = function (grunt) {

    // Load grunt tasks automatically
    require('load-grunt-tasks')(grunt);

    // Time how long tasks take. Can help when optimizing build times
    require('time-grunt')(grunt);

    // Define the configuration for all the tasks
    grunt.initConfig({

        // Project settings
        yeoman:       {
            // Configurable paths
            public:  'public',
            dist: 'dist'
        },

        // Watches files for changes and runs tasks based on the changed files
        watch:        {
            coffee:     {
                files: ['<%= yeoman.public %>/scripts/{,*/}*.{coffee,litcoffee,coffee.md}'],
                tasks: ['coffee:dist']
            },
            coffeeTest: {
                files: ['test/spec/{,*/}*.{coffee,litcoffee,coffee.md}'],
                tasks: ['coffee:test', 'test:watch']
            },
            gruntfile:  {
                files: ['Gruntfile.js']
            },
            compass:    {
                files: ['<%= yeoman.public %>/styles/{,*/}*.{scss,sass}'],
                tasks: ['compass:server', 'autoprefixer']
            },
            styles:     {
                files: ['<%= yeoman.public %>/styles/{,*/}*.css'],
                tasks: ['newer:copy:styles', 'autoprefixer']
            },
            livereload: {
                options: {
                    livereload: '<%= connect.options.livereload %>'
                },
                files:   [
                    '<%= yeoman.public %>/{,*/}*.html',
                    '.tmp/styles/{,*/}*.css',
                    '.tmp/scripts/{,*/}*.js',
                    '<%= yeoman.public %>/images/{,*/}*'
                ]
            }
        },

        // The actual grunt server settings
        connect:      {
            options:    {
                port:       9000,
                livereload: 12345,
                // Change this to '0.0.0.0' to access the server from outside
                hostname:   'localhost'
            },
            livereload: {
                options: {
                    open: true,
                    base: [
                        '.tmp',
                        '<%= yeoman.public %>'
                    ]
                }
            },
            test:       {
                options: {
                    port: 9001,
                    base: [
                        '.tmp',
                        'test',
                        '<%= yeoman.public %>'
                    ]
                }
            },
            dist:       {
                options: {
                    open:       true,
                    base:       '<%= yeoman.dist %>',
                    livereload: false
                }
            }
        },

        // Empties folders to start fresh
        clean:        {
            dist:   {
                files: [
                    {
                        dot: true,
                        src: [
                            '.tmp',
                            '<%= yeoman.dist %>/*',
                            '!<%= yeoman.dist %>/.git*'
                        ]
                    }
                ]
            },
            server: '.tmp'
        },

        // Make sure code styles are up to par and there are no obvious mistakes
        jshint:       {
            options: {
                jshintrc: '.jshintrc',
                reporter: require('jshint-stylish')
            },
            all:     [
                'Gruntfile.js',
                '<%= yeoman.public %>/scripts/{,*/}*.js',
                '!<%= yeoman.public %>/scripts/vendor/*',
                'test/spec/{,*/}*.js'
            ]
        },


        // Mocha testing framework configuration options
        mocha:        {
            all: {
                options: {
                    run:  true,
                    urls: ['http://<%= connect.test.options.hostname %>:<%= connect.test.options.port %>/index.html']
                }
            }
        },


        // Compiles CoffeeScript to JavaScript
        coffee:       {
            dist: {
                files: [
                    {
                        expand: true,
                        cwd:    '<%= yeoman.public %>/scripts',
                        src:    '{,*/}*.{coffee,litcoffee,coffee.md}',
                        dest:   '.tmp/scripts',
                        ext:    '.js'
                    }
                ]
            },
            test: {
                files: [
                    {
                        expand: true,
                        cwd:    'test/spec',
                        src:    '{,*/}*.{coffee,litcoffee,coffee.md}',
                        dest:   '.tmp/spec',
                        ext:    '.js'
                    }
                ]
            }
        },


        // Compiles Sass to CSS and generates necessary files if requested
        compass:      {
            options: {
                sassDir:                 '<%= yeoman.public %>/styles',
                cssDir:                  '.tmp/styles',
                generatedImagesDir:      '.tmp/images/generated',
                imagesDir:               '<%= yeoman.public %>/images',
                javascriptsDir:          '<%= yeoman.public %>/scripts',
                fontsDir:                '<%= yeoman.public %>/styles/fonts',
                importPath:              '<%= yeoman.public %>/vendor',
                httpImagesPath:          '/images',
                httpGeneratedImagesPath: '/images/generated',
                httpFontsPath:           '/styles/fonts',
                relativeAssets:          false,
                assetCacheBuster:        false
            },
            dist:    {
                options: {
                    generatedImagesDir: '<%= yeoman.dist %>/images/generated'
                }
            },
            server:  {
                options: {
                    debugInfo: true
                }
            }
        },

        // Add vendor prefixed styles
        autoprefixer: {
            options: {
                browsers: ['last 1 version']
            },
            dist:    {
                files: [
                    {
                        expand: true,
                        cwd:    '.tmp/styles/',
                        src:    '{,*/}*.css',
                        dest:   '.tmp/styles/'
                    }
                ]
            }
        },

        requirejs:     {
            dist: {
                // Options: https://github.com/jrburke/r.js/blob/master/build/example.build.js
                options: {
                    // `name` and `out` is set by grunt-usemin
                    baseUrl:                 '.tmp/scripts',
                    optimize:                'none',
                    name:                    "main",
                    mainConfigFile:          ".tmp/scripts/main.js",
                    // TODO: Figure out how to make sourcemaps work with grunt-usemin
                    // https://github.com/yeoman/grunt-usemin/issues/30
                    //generateSourceMaps: true,
                    // required to support SourceMaps
                    // http://requirejs.org/docs/errors.html#sourcemapcomments
                    preserveLicenseComments: false,
                    useStrict:               true,
                    wrap:                    true,
                    findNestedDependencies:  true,
                    out:                     ".tmp/concat/scripts/out.js"
                    //uglify2: {} // https://github.com/mishoo/UglifyJS2
                }
            }
        },


        // Renames files for browser caching purposes
        rev:           {
            dist: {
                files: {
                    src: [
                        '<%= yeoman.dist %>/scripts/{,*/}*.js',
                        '<%= yeoman.dist %>/styles/{,*/}*.css',
                        '<%= yeoman.dist %>/images/{,*/}*',
                        '<%= yeoman.dist %>/styles/fonts/{,*/}*.*'
                    ]
                }
            }
        },

        // Reads HTML for usemin blocks to enable smart builds that automatically
        // concat, minify and revision files. Creates configurations in memory so
        // additional tasks can operate on them
        useminPrepare: {
            options: {
                dest: '<%= yeoman.dist %>'
            },
            html:    ['<%= yeoman.public %>/*.html']
        },

        // Performs rewrites based on rev and the useminPrepare configuration
        usemin:        {
            options: {
                assetsDirs: ['<%= yeoman.dist %>']
            },
            html:    ['<%= yeoman.dist %>/{,*/}*.html'],
            css:     ["<%= yeoman.dist %>/styles/**/*.css"]
        },

        // The following *-min tasks produce minified files in the dist folder
        imagemin:      {
            dist: {
                files: [
                    {
                        expand: true,
                        cwd:    '<%= yeoman.public %>/images',
                        src:    '{,*/}*.{gif,jpeg,jpg,png}',
                        dest:   '<%= yeoman.dist %>/images'
                    }
                ]
            }
        },
        svgmin:        {
            dist: {
                files: [
                    {
                        expand: true,
                        cwd:    '<%= yeoman.public %>/images',
                        src:    '{,*/}*.svg',
                        dest:   '<%= yeoman.dist %>/images'
                    }
                ]
            }
        },
        htmlmin:       {
            dist: {
                options: {
                    collapseBooleanAttributes: true,
                    collapseWhitespace:        true,
                    removeAttributeQuotes:     true,
                    removeCommentsFromCDATA:   true,
                    removeEmptyAttributes:     true,
                    removeOptionalTags:        true,
                    removeRedundantAttributes: true,
                    useShortDoctype:           true
                },
                files:   [
                    {
                        expand: true,
                        cwd:    '<%= yeoman.dist %>',
                        src:    '{,*/}*.html',
                        dest:   '<%= yeoman.dist %>'
                    }
                ]
            }
        },

        // By default, your `index.html`'s <!-- Usemin block --> will take care of
        // minification. These next options are pre-configured if you do not wish
        // to use the Usemin blocks.
        // cssmin: {
        //     dist: {
        //         files: {
        //             '<%= yeoman.dist %>/styles/main.css': [
        //                 '.tmp/styles/{,*/}*.css',
        //                 '<%= yeoman.public %>/styles/{,*/}*.css'
        //             ]
        //         }
        //     }
        // },
        // uglify: {
        //     dist: {
        //         files: {
        //             '<%= yeoman.dist %>/scripts/scripts.js': [
        //                 '<%= yeoman.dist %>/scripts/scripts.js'
        //             ]
        //         }
        //     }
        // },
        // concat: {
        //     dist: {}
        // },

        // Copies remaining files to places other tasks can use
        copy:          {
            dist:   {
                files: [
                    {
                        expand: true,
                        dot:    true,
                        cwd:    '<%= yeoman.public %>',
                        dest:   '<%= yeoman.dist %>',
                        src:    [
                            '*.{ico,png,txt}',
                            '.htaccess',
                            'images/{,*/}*.{gif,jpeg,jpg,png}',
                            '{,*/}*.html',
                            'styles/fonts/{,*/}*.*',
                            'vendor/bootstrap-sass/vendor/assets/fonts/bootstrap/*.*',
                            'vendor/fontawesome/fonts/*',
                            'vendor/music-player-1.0.1/plugin/images/*.{jpg,png}'
                        ]
                    },
                    {
                        expand: true,
                        dot:    true,
                        cwd:    '<%= yeoman.public %>',
                        dest:   '<%= yeoman.dist %>',
                        src:    [
                            '*.{ico,png,txt}'
                        ]
                    }
                ]
            },
            bodge:  {
                files: [
                    {
                        expand: true,
                        dot:    true,
                        cwd:    '<%= yeoman.public %>',
                        dest:   '.tmp',
                        src:    [
                            '**/*.js'
                        ]
                    }
                ]
            },
            styles: {
                expand: true,
                dot:    true,
                cwd:    '<%= yeoman.public %>/styles',
                dest:   '.tmp/styles/',
                src:    '{,*/}*.css'
            }
        },


        // Generates a custom Modernizr build that includes only the tests you
        // reference in your public
        modernizr:     {
            dist: {
                devFile:    '<%= yeoman.public %>/vendor/modernizr/modernizr.js',
                outputFile: '<%= yeoman.dist %>/scripts/vendor/modernizr.js',
                files:      {
                    src: [
                        '<%= yeoman.dist %>/scripts/{,*/}*.js',
                        '<%= yeoman.dist %>/styles/{,*/}*.css',
                        '!<%= yeoman.dist %>/scripts/vendor/*'
                    ]
                },
                uglify:     true
            }
        },

        // Run some tasks in parallel to speed up build process
        concurrent:    {
            server: [
                'compass:server',
                'coffee:dist',
                'copy:styles'
            ],
            test:   [
                'coffee',
                'copy:styles'
            ],
            dist:   [
                'coffee',
                'compass',
                'copy:styles',
                'imagemin',
                'svgmin'
            ]
        }
    });


    grunt.registerTask('serve', function (target) {
        if (target === 'dist') {
            return grunt.task.run(['build', 'connect:dist:keepalive']);
        }

        grunt.task.run([
            'clean:server',
            'concurrent:server',
            'autoprefixer',
            'connect:livereload',
            'watch'
        ]);
    });

    grunt.registerTask('server', function (target) {
        grunt.log.warn('The `server` task has been deprecated. Use `grunt serve` to start a server.');
        grunt.task.run([target ? ('serve:' + target) : 'serve']);
    });

    grunt.registerTask('test', function (target) {
        if (target !== 'watch') {
            grunt.task.run([
                'clean:server',
                'concurrent:test',
                'autoprefixer'
            ]);
        }

        grunt.task.run([
            'connect:test',
            'mocha'
        ]);
    });

    grunt.registerTask('build', [
        "clean:dist",
        "copy:bodge",
        "concurrent:dist",
        "useminPrepare",
        "concat",
        "autoprefixer",
        "requirejs:dist",
        "cssmin",
        "uglify",
        "copy:dist",
        "modernizr",
        "rev",
        "usemin",
        "htmlmin"
    ]);

    grunt.registerTask('default', [
        'newer:jshint',
        'bower',
        'test',
        'build'
    ]);
};
