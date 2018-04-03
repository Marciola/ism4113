defmodule Ism4113.SalesTest do
  use Ism4113.DataCase

  alias Ism4113.Sales

  describe "vendors" do
    alias Ism4113.Sales.Vendor

    @valid_attrs %{name: "some name", phone: 42, website: "some website"}
    @update_attrs %{name: "some updated name", phone: 43, website: "some updated website"}
    @invalid_attrs %{name: nil, phone: nil, website: nil}

    def vendor_fixture(attrs \\ %{}) do
      {:ok, vendor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_vendor()

      vendor
    end

    test "list_vendors/0 returns all vendors" do
      vendor = vendor_fixture()
      assert Sales.list_vendors() == [vendor]
    end

    test "get_vendor!/1 returns the vendor with given id" do
      vendor = vendor_fixture()
      assert Sales.get_vendor!(vendor.id) == vendor
    end

    test "create_vendor/1 with valid data creates a vendor" do
      assert {:ok, %Vendor{} = vendor} = Sales.create_vendor(@valid_attrs)
      assert vendor.name == "some name"
      assert vendor.phone == 42
      assert vendor.website == "some website"
    end

    test "create_vendor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_vendor(@invalid_attrs)
    end

    test "update_vendor/2 with valid data updates the vendor" do
      vendor = vendor_fixture()
      assert {:ok, vendor} = Sales.update_vendor(vendor, @update_attrs)
      assert %Vendor{} = vendor
      assert vendor.name == "some updated name"
      assert vendor.phone == 43
      assert vendor.website == "some updated website"
    end

    test "update_vendor/2 with invalid data returns error changeset" do
      vendor = vendor_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_vendor(vendor, @invalid_attrs)
      assert vendor == Sales.get_vendor!(vendor.id)
    end

    test "delete_vendor/1 deletes the vendor" do
      vendor = vendor_fixture()
      assert {:ok, %Vendor{}} = Sales.delete_vendor(vendor)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_vendor!(vendor.id) end
    end

    test "change_vendor/1 returns a vendor changeset" do
      vendor = vendor_fixture()
      assert %Ecto.Changeset{} = Sales.change_vendor(vendor)
    end
  end

  describe "products" do
    alias Ism4113.Sales.Product

    @valid_attrs %{name: "some name", price: 42}
    @update_attrs %{name: "some updated name", price: 43}
    @invalid_attrs %{name: nil, price: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Sales.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Sales.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Sales.create_product(@valid_attrs)
      assert product.name == "some name"
      assert product.price == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Sales.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.name == "some updated name"
      assert product.price == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_product(product, @invalid_attrs)
      assert product == Sales.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Sales.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Sales.change_product(product)
    end
  end
end
