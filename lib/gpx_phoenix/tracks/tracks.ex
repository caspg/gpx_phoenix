defmodule GpxPhoenix.Tracks do
  @moduledoc """
  The Tracks context.
  """

  import Ecto.Query, warn: false
  alias GpxPhoenix.Repo

  alias GpxPhoenix.Tracks.Track

  def get_track!(id), do: Repo.get!(Track, id)

  def list_tracks, do: Repo.all(Track)

  def create_track(attrs \\ %{}) do
    %Track{}
    |> Track.changeset(attrs)
    |> Repo.insert()
  end

  def change_track(%Track{} = track), do: Track.changeset(track, %{})

  def get_geom_as_geojson!(%{id: id}) do
    query =
      from(t in Track,
        where: t.id == ^id,
        select: fragment("ST_AsGeoJSON(?)::json", t.geom)
      )

    Repo.one!(query)
  end
end
