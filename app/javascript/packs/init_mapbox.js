import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');



  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/lilypotter123/ckgv8vv98273n19pgahygl98j'
    });

    map.addControl(new mapboxgl.NavigationControl());


    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow)

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });

    fitMapToMarkers(map, markers);

    };
}

export { initMapbox };

// const geolocalize = (query) => {
//   fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?access_token=${myApiKey}`)
//     .then(response => response.json())
//     .then((data) => {
//       const coordinates = data.features[0].geometry.coordinates;
//       console.log(coordinates);
//       mapboxgl.accessToken = 'pk.eyJ1IjoidGVtcDExIiwiYSI6ImNrZzI0eWdoaTA0bzYzMnFzcnEzdGl3NGYifQ.SnYF03XsT7T2hPJr3MBczA';
//       const map = new mapboxgl.Map({
//         container: 'map',
//         style: 'mapbox://styles/mapbox/streets-v9',
//         center: coordinates,
//         zoom: 12
//       });
//       new mapboxgl.Marker()
//         .setLngLat(coordinates)
//         .addTo(map);
//     });
// };




