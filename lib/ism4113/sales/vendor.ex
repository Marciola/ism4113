defmodule Ism4113.Sales.Vendor do
  use Ecto.Schema
  import Ecto.Changeset


  schema "vendors" do
    field :name, :string
    field :phone, :integer
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name, :website, :phone])
    |> validate_required([:name, :website, :phone])
  end
end
