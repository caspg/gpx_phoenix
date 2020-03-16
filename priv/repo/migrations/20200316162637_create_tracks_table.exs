defmodule GpxPhoenix.Repo.Migrations.CreateTracksTable do
  use Ecto.Migration

  def up do
    create table(:tracks) do
      add(:name, :string)

      timestamps()
    end

    execute("SELECT AddGeometryColumn ('tracks','geom',3857,'MULTILINESTRINGZ', 3);")
  end

  def down do
    drop table(:tracks)
  end
end
