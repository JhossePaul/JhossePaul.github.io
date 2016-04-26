'use strict'
gulp        = require "gulp"
browserSync = require "browser-sync"
onError     = require "../error"
plugins     = require "gulp-load-plugins"
$           = plugins()

gulp.task 'production:pug', ->
    gulp.src './src/pug/**/!(_)*.pug'
    .pipe $.accord 'jade',
        basedir : './src/pug'
    .pipe(gulp.dest './dist')
    .pipe browserSync.reload
        stream: true
                
                
