defmodule GpxPhoenix.Tracks.Track do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tracks" do
    field(:name, :string)
    field(:geom, Geo.PostGIS.Geometry)

    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:name, :geom])
    |> validate_required([:name, :geom])
  end
end
