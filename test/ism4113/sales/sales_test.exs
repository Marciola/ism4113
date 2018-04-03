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
end
