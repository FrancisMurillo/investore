defmodule InvestoreProductsTest do
  @moduledoc nil

  use ExUnit.Case

  import InvestoreProducts.TestFactory

  alias Ecto
  alias Ecto.Changeset

  alias InvestoreProducts, as: Context
  alias Context.{Product, Repo}

  def product_fixture(_context) do
    Repo.delete_all(Product)

    :ok
  end

  setup_all do
    Application.ensure_all_started(:investore_products)

    :ok
  end

  describe "Add product" do
    setup [:product_fixture]

    @tag :positive
    test "should work with valid data and only once" do
      params = string_params_for(:product, %{})

      assert {:ok, %Product{}} = Context.add_product(params)
      assert {:error, %Changeset{}} = Context.add_product(params)
    end

    @tag :negative
    test "should fail with invalid data" do
      params = %{}

      assert {:error, %Changeset{valid?: false}} = Context.add_product(params)
    end
  end

  describe "Search product" do
    setup [:product_fixture]

    @tag :positive
    test "should work with empty and valid search query" do
      count = 10

      insert_list(count, :product, %{})

      assert {:ok, all_products} = Context.resolve_search_products(nil, %{search_query: ""}, nil)

      assert count == length(all_products)

      search_query =
        all_products
        |> Enum.random()
        |> Map.get(:name)

      assert {:ok, fewer_products} =
               Context.resolve_search_products(nil, %{search_query: search_query}, nil)

      assert 0 < length(fewer_products) and count > length(fewer_products)
    end
  end
end
