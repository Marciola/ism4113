defmodule Ism4113.Repo.Migrations.CreateVendors do
  use Ecto.Migration

  def change do
    create table(:vendors) do
      add :name, :string
      add :website, :string
      add :phone, :integer

      timestamps()
    end

  end
end
