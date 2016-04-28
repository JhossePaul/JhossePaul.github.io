(function() {
  var dygraph;

  dygraph = new Dygraph(document.getElementById("dygraph"), "/assets/data/dygraph.csv");

}).call(this);

(function() {
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [["$", "$"], ["\\(", "\\)"]]
    }
  });

}).call(this);

(function() {
  var color, force, height, svg, width;

  console.log("d3.js Network");

  width = 600;

  height = 300;

  color = d3.scale.category20();

  force = d3.layout.force().charge(-120).linkDistance(30).size([width, height]);

  svg = d3.select("#network").append("svg").attr("width", width).attr("height", height);

  d3.json("/assets/data/network.json", function(error, graph) {
    var link, node;
    if (error) {
      throw error;
    }
    force.nodes(graph.nodes).links(graph.links).start();
    link = svg.selectAll(".link").data(graph.links).enter().append("line").attr("class", "link").style("stroke-width", function(d) {
      return Math.sqrt(d.value);
    });
    node = svg.selectAll(".node").data(graph.nodes).enter().append("circle").attr("class", "node").attr("r", 5).style("fill", function(d) {
      return color(d.group);
    }).call(force.drag);
    node.append("title").text(function(d) {
      return color(d.group);
    });
    force.on("tick", function() {
      link.attr("x1", function(d) {
        return d.source.x;
      }).attr("y1", function(d) {
        return d.source.y;
      }).attr("x2", function(d) {
        return d.target.x;
      }).attr("y2", function(d) {
        return d.target.y;
      });
      node.attr("cx", function(d) {
        return d.x;
      }).attr("cy", function(d) {
        return d.y;
      });
    });
  });

}).call(this);

//# sourceMappingURL=app.js.map
