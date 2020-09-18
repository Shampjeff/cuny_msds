var tabulate = function (data,columns) {
            var table = d3.select('body').append('table')
            var thead = table.append('thead')
            var tbody = table.append('tbody')

            thead.append('tr')
              .selectAll('th')
                .data(columns)
                .enter()
              .append('th')
                .text(function (d) { return d })

            var rows = tbody.selectAll('tr')
                .data(data)
                .enter()
              .append('tr')

            var cells = rows.selectAll('td')
                .data(function(row) {
                    return columns.map(function (column) {
                        return { column: column, value: row[column] }
                  })
              })
              .enter()
            .append('td')
              .text(function (d) { return d.value })

          return table
        }

function TitleCase(str) {
  return str.toLowerCase().split(' ').map(function(word) {
    return word.replace(word[0], word[0].toUpperCase());
  }).join(' ');
}
        
function filter_name(){
      var pres = document.getElementById('search_name').value
      var data_csv = 'presidents.csv'
      if (pres != "") {
          var pres = TitleCase(pres)
      } 
      var t = d3.csv(data_csv,function (data) {
        var columns = ['Name','Height','Weight'];
        var subset = data.filter( function(d) { return d.Name.indexOf( pres ) !== -1 } ); 
        tabulate(subset,columns) });
    }
