// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
 /*
 * Play with this code and it'll update in the panel opposite.
 *
 * Why not try some of the options above?
 */
  $("#locate").on("click", get_my_data);

  function get_my_data(){
    if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(show_weather, show_error);
    } else {
      alert ("You need geolocation for this");
    }
  }

  function show_error(){
    alert("Error");
  }
  function show_weather(position){
    console.log(position)
    var latitude = position.coords.latitude
    var longitude = position.coords.longitude
      
    options = {
      url: "/update_location", 
      type: "get",             
      data: {
        "location[latitude]": latitude, 
        "location[longitude]": longitude
      },
      complete: parseData   
    };

    $.ajax(options);
  }

  var options = {
    url: "/data",
    complete: parseData
  }

  $.ajax(options);

  function parseData(response){
    console.log(response.responseText);
    data = $.parseJSON(response.responseText);

    plot_graph(data);

  }

  function plot_graph(data){
    $("#graph").remove()
    $("body").append('<div id="graph"></div>')
     Morris.Line({
      parseTime: false,
      element: 'graph',
      data: data,
      xkey: "date",
      ykeys: ['max', 'min'],
      labels: ["Max", "Min"]
    })  
  }

/*Morris.Line({
  element: 'graph',
  data: [
    { y: '2006', a: 100, b: 90 },
    { y: '2007', a: 75,  b: 65 },
    { y: '2008', a: 50,  b: 40 },
    { y: '2009', a: 75,  b: 65 },
    { y: '2010', a: 50,  b: 40 },
    { y: '2011', a: 75,  b: 65 },
    { y: '2012', a: 100, b: 90 }
  ],
  xkey: 'y',
  ykeys: ['a', 'b'],
  labels: ['Series A', 'Series B']
}); */

});
