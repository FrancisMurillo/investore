defmodule InvestoreProductServiceTest do
  @moduledoc nil

  use ExUnit.Case

  alias InvestoreProducts, as: Core

  alias InvestoreProductServices, as: Context

  describe "Product services" do
    setup do
      :ok = :net_kernel.monitor_nodes(true)

      {:ok, hostname} = :inet.gethostname()

      Node.start(:"master@#{hostname}", :shortnames)

      nodes = Enum.map(1..3, fn index ->
        {:ok, node} = :slave.start_link(:"#{hostname}", 'product-test-#{index}')

        :rpc.call(node, :code, :add_paths, [ :code.get_path() ])
        :rpc.call(node, Application, :ensure_all_started, [ :mix ])
        :rpc.call(node, Mix, :env, [ Mix.env() ])

        Application.loaded_applications()
        |> Enum.map(&elem(&1, 0))
        |> Enum.concat([:investore_products])
        |> Enum.each(fn app_name ->
          app_name
          |> Application.get_all_env()
          |> Enum.each(fn {key, value} ->
            :rpc.call(node, Application, :put_env, [ app_name, key, value ])
          end)

          :rpc.call(node, Application, :ensure_all_started, [ app_name ])
        end)

        node
      end)

      on_exit(fn ->
        Enum.each(nodes, &:slave.stop/1)
      end)

      Application.ensure_all_started(:investore_product_services)

      Context.Application.refresh_nodes()

      :ok
    end

    @tag :positive
    test "search products resolver should work" do
      assert {:ok, _} = Context.resolve_search_products(nil, %{search_query: ""}, nil)
      |> IO.inspect(label: "kitten")
    end
  end
end
