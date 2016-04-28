(function() {
  var color, dygraph, force, height, svg, width;

  dygraph = new Dygraph(document.getElementById("dygraph"), "/assets/data/dygraph.csv", {
    title: "Time Series Analysis"
  });

  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [["$", "$"], ["\\(", "\\)"]]
    }
  });

  new WOW().init();

  width = 960;

  height = 500;

  color = d3.scale.category20();

  force = d3.layout.force().charge(-120).linkDistance(30).size([width, height]);

  svg = d3.select("body").append("svg").attr("width", width).attr("height", height);

  d3.json("miserables.json", function(error, graph) {
    if (error) {
      throw error;
    }
  });

}).call(this);

//# sourceMappingURL=app.js.map
