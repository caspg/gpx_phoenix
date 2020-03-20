defmodule GpxPhoenixWeb.TracksController do
  use GpxPhoenixWeb, :controller

  def index(conn, _params) do
    tracks = GpxPhoenix.Tracks.list_tracks()
    render(conn, "index.html", tracks: tracks)
  end

  def show(conn, %{"id" => id} = _params) do
    track = GpxPhoenix.Tracks.get_track!(id)
    render(conn, "show.html", track: track)
  end

  def geojson(conn, %{"id" => id} = _params) do
    geojson = GpxPhoenix.Tracks.get_geom_as_geojson!(%{id: id})

    json(conn, geojson)
  end
end
