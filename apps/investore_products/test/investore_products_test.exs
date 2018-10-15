defmodule InvestoreProductsTest do
  use ExUnit.Case

  import InvestoreProducts.Factory

  alias Ecto
  alias Ecto.Changeset

  alias InvestoreProducts, as: Context
  alias Context.{Product, Repo}

  def fixture(_context) do
    Application.ensure_all_started(:investore_products)

    :ok
  end

  def product_fixture(_context) do
    Repo
    |> Ecto.Adapters.SQL.query!("""
    DELETE FROM #{Product.__schema__(:source)}
    """)

    :ok
  end

  describe "Add product" do
    setup [:fixture, :product_fixture]

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
end
