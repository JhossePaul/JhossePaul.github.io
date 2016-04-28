module.exports = 
    # Acá se añaden las rutas a los archivos scss obtenidos de bower
    sassIncludes: [
        "./src/bower/bem-constructor/dist"
        "./src/bower/jeet/scss"
        "./src/bower/modular-scale/stylesheets"
    ]
    # Acá se añaden las rutas a los archivos js obtenidos por bower
    scriptFiles: [
        "./src/bower/jquery/dist/jquery.min.js"
        "./src/bower/wow/dist/wow.min.js"
        "./src/bower/d3/d3.min.js"
        "./src/bower/dygraphs/dygraph-combined.js"

    ]
    # Archivos HTML que deben pasar por uncss
    uncssHTML: [
        "./dist/index.html"
    ]
    # Acá se agregan las clases No HTML como las clases js/jQuery
    uncssIgnore: [
        ""
    ]
    # Rutas a las fuentes
    fonts: [
        "./src/fonts/*.otf"
        "./src/fonts/*.ttf"
    ]
    
