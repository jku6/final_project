var map;
var canvas;

$(function(){

});


function display_map(lat, long, zoom)
{
  var styledMap = new google.maps.StyledMapType(styles,
    {name: "Styled Map"});
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
    }
  };

  canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
}
function display_map2(lat, long, zoom)
{
  var styledMap = new google.maps.StyledMapType(styles,
    {name: "Styled Map"});
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  canvas = $('#self_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
}

infos = [];
function add_marker(lat, long, title, url, address)
{
  var latlng = new google.maps.LatLng(lat, long);
  var marker = new google.maps.Marker({position: latlng, map: map, title:title, url:url, address:address});
  google.maps.event.addListener(marker, 'click', function() {
    map.setZoom(14);
    map.setCenter(marker.getPosition());
  });
  // var infowindow = new google.maps.InfoWindow({
  // content: "<p>" + title + "<br />" + '<a href=' + url + ' target="_blank">Link</a>' + "<br />" + address + "</p>"
  
  // });
  google.maps.event.addListener(marker, 'click', function() {
  // infowindow.open(map, marker);
    closeInfos();
 
    /* the marker's content gets attached to the info-window: */
    var info = new google.maps.InfoWindow({
    content: "<p>" + title + "<br />" + '<a href=' + url + ' target="_blank">Link</a>' + "<br />" + address + "</p>"
  
    });
     
    /* trigger the infobox's open function */
    info.open(map, this);
     
    /* keep the handle, in order to close it on next click event */
    infos[0]=info;

 });
    function closeInfos(){
 
   if(infos.length > 0){
 
      /* detach the info-window from the marker */
      infos[0].set("marker",null);
 
      /* and close it */
      infos[0].close();
 
      /* blank the array */
      infos.length = 0;
   }
  } 


// var map = new GMap2(document.getElementById("map"));
// map.setCenter(new GLatLng(37.4419, -122.1419), 13);
// var mcOptions = { gridSize: 50, maxZoom: 15};
// var markers = [...]; // Create the markers you want to add and collect them into a array.
// var mc = new MarkerClusterer(map, markers, mcOptions);

//   var markers = [];
//   for (var i = 0; i < 100; ++i) {
//     var latlng = new GLatLng(data.photos[i].latitude, data.photos[i].longitude);
//     var marker = new GMarker(latlng);
//     markers.push(marker);
//   }
//   var markerCluster = new MarkerClusterer(map, markers);


}

// google.maps.event.addListener(marker, 'click', function() {
//     map.setZoom(8);
//     map.setCenter(marker.getPosition());
// });