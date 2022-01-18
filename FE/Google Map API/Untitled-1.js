// In this example, we center the map, and add a marker, using a LatLng object
// literal instead of a google.maps.LatLng object. LatLng object literals are
// a convenient way to add a LatLng coordinate and, in most cases, can be used
// in place of a google.maps.LatLng object.
let map;

function initMap() {

 // set default location in case there is no markers return from API
 // the lat and lng here are from the 'googleCity' that Daniel returns from API
 const center = [34.0775513, -118.2889369];
 
  var mapOptions = {
    // default zoom when there is no marker
    zoom: 10,
    
    // set center when there is no marker
    center: {
      // lat of default location
      lat: center[0],
      // lng of default location
      lng: center[1]
    },

  };

  // initialize map
  map = new google.maps.Map(document.getElementById("map"), mapOptions);
  
 	// get the bounds of the init map
  var bounds = new google.maps.LatLngBounds();


  /* const centerId = ChIJUzOYWV3HwoAR9kSepVTqvK0 */

 // lat and lng list from total markers returned from API, eg. Deal, job, housing, marketplace, business or all
  const locations = [
    [34.0775513, -118.2889369],
    [34.0823293, -118.3238559],
    [34.1015790240342, -118.32933737473091],
    [34.1014734, -118.3011674],
    [34.1014399, -118.3028768],
    [34.1019468, -118.305417],
    [34.1014732, -118.3011566],
    [34.1012719, -118.3014971],
    [34.1020334, -118.3024949],
    [34.0985569, -118.3058158],
    [34.0985991, -118.3030002],
    [34.1014471, -118.3031094],
    [34.0982306, -118.3218728],
    [34.1014977, -118.3017156],
    [34.0954921, -118.2849028],
    [34.0973572, -118.2920819],
    [34.1019212, -118.3059445],
    [34.1019251, -118.3074214],
    [34.1015313, -118.3130266],
    [34.1020347, -118.3026005],
    [34.1014732, -118.3011566],
    [34.1014591, -118.3041994], 
  ]
  
  // when there is at least 1 marker
  if (locations.length > 0) {
    // loop through each marker
    for (i = 0; i < locations.length; i++) {
      // create marker
      var marker = new google.maps.Marker({
        //  set marker location
        position: new google.maps.LatLng(locations[i][0], locations[i][1]),
        // set marker img (optional)
        icon: image[i],
        // optimize marker performance
        optimized: true,
        // add to map
        map: map,
      });

      //extend the bounds to include each marker's position
      bounds.extend(marker.position);

    }

    // now fit the map to the newly inclusive bounds  
    map.fitBounds(bounds);
    
    //now center the map based on the updated bounds
    map.panToBounds(bounds);
  }

  // listener to the map when the zoom is too close
  var listener = google.maps.event.addListener(map, "idle", function() {
    if (map.getZoom() > 16) map.setZoom(16);
    google.maps.event.removeListener(listener);
  });
  
}



