'use strict'
gulp		= require "gulp"
browserSync	= require "browser-sync"
runSequence	= require("run-sequence").use(gulp)
requireDir	= require "require-dir"


# Require tasks
requireDir "./tasks",
    recurse: true

# Default browsersync task
gulp.task "browsersync", ->
    browserSync
        port: 1705
        ui:
            port: 1706
        server:
            baseDir: "./dist"
        open: false
        tunnel: false
        online: true
        logConnections: true

# File supervisor
gulp.task "watch", ["browsersync"], ->
    gulp.watch 'src/jade/**', ['jade']
    gulp.watch "src/sass/**", ["sass"]
    gulp.watch "src/coffee/**", ["coffee"]
    gulp.watch "src/bower/**", ["scripts", "sass"]
    gulp.watch "src/img/**", ["imagemin"]
    gulp.watch "src/assets/**", ["assets"]
    gulp.watch "src/svg/**", ["svg", "jade"]
    gulp.watch "src/fonts/**", ["fonts"]
    gulp.watch "gulp/tasks/config.coffee", ["scripts"]

# Default task
gulp.task "default", ->
    runSequence "clean",
        "scripts"
        "coffee",
        "fonts",
        "sass",
        "imagemin",
        "assets",
        "jade",
        "watch"


# GitLab Tasks
# gulp.task "gitlab", ->
#     runSequence "clean",
#        "scripts"
#        "coffee"
#        "fonts"
#        "sass"
#        "imagemin"
#        "assets"
#        "jade"
