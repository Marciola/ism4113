defmodule Ism4113Web.ProductController do
  use Ism4113Web, :controller

  alias Ism4113.Sales
  alias Ism4113.Sales.Product
  alias Ism4113.Sales.Vendor

  def index(conn, _params) do
    products = Sales.list_products()
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    vendors = Repo.all from Vendor, select: {v.name, v.id}
    changeset = Sales.change_product(%Product{})
    render(conn, "new.html", changeset: changeset, vendors: vendors)
  end

  def create(conn, %{"product" => product_params}) do
    case Sales.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: product_path(conn, :show, product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Sales.get_product!(id)
    render(conn, "show.html", product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = Sales.get_product!(id)
    changeset = Sales.change_product(product)
    render(conn, "edit.html", product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Sales.get_product!(id)

    case Sales.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: product_path(conn, :show, product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Sales.get_product!(id)
    {:ok, _product} = Sales.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: product_path(conn, :index))
  end
end
