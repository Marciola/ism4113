defmodule Ism4113.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :price, :integer
      add :vendor_id, references(:vendor, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:vendor])
  end
end
