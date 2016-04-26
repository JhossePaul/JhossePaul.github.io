'use strict'
gulp        = require "gulp"
browserSync = require "browser-sync"
onError     = require "./error"
plugins     = require "gulp-load-plugins"
$           = plugins()

gulp.task "pug", ->
    gulp.src "./src/pug/**/!(_)*.pug"
    .pipe $.plumber(errorHandler: onError)
    .pipe $.accord "jade",
        pretty: true
        basedir: "./src/pug"
    .pipe gulp.dest "./dist"
    .pipe browserSync.reload
        stream: true
