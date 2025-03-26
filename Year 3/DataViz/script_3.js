// set the dimensions and margins of the graph
var margin = {top: 30, right: 30, bottom: 30, left: 60},
    width = 460 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// Function to normalize column names
function normalizeColumnName(name) {
    return name.trim().toLowerCase().replace(/\s+/g, "_").replace(/[^a-z0-9_]/g, "");
}


// append the svg3 object to the body of the page
var svg3 = d3.select("#my_dataviz_2")
  .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");

// get the data
d3.csv("project_heart_disease.csv", function(data) {
     // Normalize column names
     data.forEach(d => {
        Object.keys(d).forEach(key => {
            let newKey = normalizeColumnName(key);
            if (newKey !== key) {
                d[newKey] = d[key];
                delete d[key];
            }
        });
    });

    // Remove rows with missing cholesterol or heart_disease_status
    data = data.filter(d => d.bmi && d.heart_disease_status);
    data.forEach(d => d.bmi = +d.bmi);

  // add the x Axis
  var minBMI = d3.min(data, d => d.bmi);
  var maxBMI = d3.max(data, d => d.bmi);
  console.log(maxBMI);  
  console.log(minBMI);
  var x = d3.scaleLinear()
      .domain([minBMI-10,maxBMI+10])
      .range([0, width]);
  svg3.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x));

  // add the first y Axis
  var y1 = d3.scaleLinear()
            .range([height/2, 0])
            .domain([0, 0.12]);
  svg3.append("g")
    .attr("transform", "translate(-20,0)")
    .call(d3.axisLeft(y1).tickValues([0.05, 0.1]));

  // add the first y Axis
  var y2 = d3.scaleLinear()
            .range([height/2, height])
            .domain([0, 0.12]);
  svg3.append("g")
      .attr("transform", "translate(-20,0)")
      .call(d3.axisLeft(y2).ticks(2).tickSizeOuter(0));

  // Compute kernel density estimation
  var kde = kernelDensityEstimator(kernelEpanechnikov(7), x.ticks(60))
  var density1 =  kde( data
      .filter( function(d){return d.heart_disease_status === "Yes"} )
      .map(function(d){  return d.bmi; }) )
  var density2 =  kde( data
      .filter( function(d){return d.heart_disease_status === "No"} )
      .map(function(d){  return d.bmi; }) )

  // Plot the area
  svg3.append("path")
      .attr("class", "mypath")
      .datum(density1)
      .attr("fill", "red")
      .attr("opacity", ".6")
      .attr("stroke", "#000")
      .attr("stroke-width", 1)
      .attr("stroke-linejoin", "round")
      .attr("d",  d3.line()
        .curve(d3.curveBasis)
          .x(function(d) { return x(d[0]); })
          .y(function(d) { return y1(d[1]); })
      );

  // Plot the area
  svg3.append("path")
      .attr("class", "mypath")
      .datum(density2)
      .attr("fill", "green")
      .attr("opacity", ".6")
      .attr("stroke", "#000")
      .attr("stroke-width", 1)
      .attr("stroke-linejoin", "round")
      .attr("d",  d3.line()
        .curve(d3.curveBasis)
          .x(function(d) { return x(d[0]); })
          .y(function(d) { return y2(d[1]); })
      );

});

// Add Y axis label
svg3.append("text")
.attr("transform", "rotate(-90)")
.attr("x", -height / 2)
.attr("y", -margin.left + 10)
.attr("text-anchor", "middle")
.style("font-size", "14px")
.text("BMI");

// Add X axis label
svg3.append("text")
.attr("x", width / 2)
.attr("y", height + margin.bottom)
.attr("text-anchor", "middle")
.style("font-size", "14px")
.text("Heart Disease Status");

// Handmade legend
svg3.append("circle").attr("cx",290).attr("cy",30).attr("r", 6).style("fill", "red")
svg3.append("circle").attr("cx",290).attr("cy",60).attr("r", 6).style("fill", "green")
svg3.append("text").attr("x", 310).attr("y", 30).text("Yes").style("font-size", "15px").attr("alignment-baseline","middle")
svg3.append("text").attr("x", 310).attr("y", 60).text("No").style("font-size", "15px").attr("alignment-baseline","middle")

// Function to compute density
function kernelDensityEstimator(kernel, X) {
  return function(V) {
    return X.map(function(x) {
      return [x, d3.mean(V, function(v) { return kernel(x - v); })];
    });
  };
}
function kernelEpanechnikov(k) {
  return function(v) {
    return Math.abs(v /= k) <= 1 ? 0.75 * (1 - v * v) / k : 0;
  };
}