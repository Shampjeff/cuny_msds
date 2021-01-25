d3.csv('ue_industry.csv', data => {

    const xScale = d3.scaleLinear()
                .domain(d3.extent(data, d => +d.index))
                .range([1180, 20]);
            
    const yScale = d3.scaleLinear()
                .domain(d3.extent(data, d => +d.Agriculture))
                .range([580, 20]);

    const line3 = d3.line()
            .x(d => xScale(d.index))
            .y(d => yScale(d.Agriculture));

    d3.select('#answer1')
    		.append('path')
            .attr("stroke", "steelblue")
            .attr("stroke-width", 1.5)
            .attr('d', line3(data));

});
