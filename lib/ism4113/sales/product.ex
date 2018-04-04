defmodule Ism4113.Sales.Product do
  use Ecto.Schema
  import Ecto.Changeset


  schema "products" do
    field :name, :string
    field :price, :integer
    #field :vendor, :id
    has_one :vendor, Ism4113.Sales.Vendor

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
