// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

function renderMap() {
  const trackMap = document.getElementById('track-map')

  if (!trackMap) {
    return
  }

  // create leaflet map object
  const map = L.map(trackMap)

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution:
      '&copy <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map)

  const trackId = trackMap.dataset.trackId

  // fetch geojson and add it to the map as new layer
  fetch(`/tracks/${trackId}/geojson`)
    .then(res => res.json())
    .then(geojson => {
      const geojsonLayer = L.geoJSON(geojson).addTo(map)

      // handy function that makes sure our track will fit the map
      map.fitBounds(geojsonLayer.getBounds())
    })
}

renderMap()
