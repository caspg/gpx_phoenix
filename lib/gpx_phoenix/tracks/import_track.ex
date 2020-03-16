defmodule GpxPhoenix.Tracks.ImportTrack do
  alias GpxPhoenix.Tracks.Track

  @spec call(gpx_doc: String.t()) ::
          {:error, :invalid_gpx} | {:error, %Ecto.Changeset{}} | {:ok, %Track{}}

  def call(gpx_doc) do
    gpx_doc
    |> GpxEx.parse()
    |> get_first_track()
    |> build_track_geometry()
    |> create_track()
  end

  defp get_first_track({:ok, %GpxEx.Gpx{tracks: [track | _]}}), do: {:ok, track}

  defp build_track_geometry({:ok, %GpxEx.Track{segments: segments} = track}) do
    multilinez_coordinates = convert_segments_to_mulitlinez(segments)

    track_geometry = %Geo.MultiLineStringZ{
      coordinates: multilinez_coordinates,
      srid: 3857
    }

    {:ok, track, track_geometry}
  end

  defp convert_segments_to_mulitlinez([%GpxEx.TrackSegment{} | _] = segments) do
    Enum.map(segments, fn segment ->
      Enum.map(segment.points, fn point ->
        {point.lon, point.lat, point.ele}
      end)
    end)
  end

  defp create_track({:ok, %GpxEx.Track{name: name}, track_geometry}) do
    GpxPhoenix.Tracks.create_track(%{name: name, geom: track_geometry})
  end
end
