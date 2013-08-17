"use strict"

# Karma E2E configuration
module.exports = (config) ->
  config.set
    frameworks: ["ng-scenario"]

    plugins: [
      "karma-ng-scenario"
      "karma-phantomjs-launcher"
      "karma-coffee-preprocessor"
    ]

    #preprocessors:
    #  "test/e2e/**/*.coffee": 'coffee'

    #coffeePreprocessor:
    #  options:
    #    bare: true
    #    sourceMap: false
    #  transformPath: (path) ->
    #    path.replace /\.coffee$/, '.js'


    # base path, that will be used to resolve files and exclude
    basePath: ""

    # list of files / patterns to load in the browser
    files: [
      "test/e2e/**/*.coffee"
    ]

    # list of files to exclude
    exclude: []

    # test results reporter to use
    # possible values: dots || progress || growl
    reporters: ["progress"]

    # web server port
    port: 8082

    # cli runner port
    runnerPort: 9100

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: "karma.LOG_INFO"

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari (only Mac)
    # - PhantomJS
    # - IE (only Windows)
    browsers: ["PhantomJS"]

    # If browser does not capture in given timeout [ms], kill it
    captureTimeout: 5000

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: false

    # Uncomment the following lines if you are using grunt's server to run the tests
    proxies:
      '/': 'http://localhost:9000/'

    # URL root prevent conflicts with the site root
    urlRoot: '_karma_'
