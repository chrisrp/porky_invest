$(function () {

$.ajax({
  url: "/indice_cdi.json",
context: document.body
}).done(function(data) {
  var dataSource = [];

  data.forEach(function(indice) {
    dataSource.push([Date.parse(indice.data), indice.taxa_di]);
  });
    $('#container').highcharts('StockChart', {
      rangeSelector : {
                        selected : 1,
    inputEnabled: $('#container').width() > 480 },
    title : {
              text : 'Histórico taxas'
            },
    series : [{
      data : dataSource
      ,
    tooltip: {
      valueDecimals: 2
    } }]
    });

});

});

