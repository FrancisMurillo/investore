defmodule InvestoreWeb.Router do
  @moduledoc false

  use InvestoreWeb.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :graphql do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Jason
  end

  scope "/api" do
    pipe_through(:api)
    pipe_through(:graphql)

#    forward("/",  Absinthe.Plug, schema: GraphqlWeb.Schema)
    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: InvestoreWeb.Schema, interface: :simple, context: %{pubsub: InvestoreWeb.Endpoint})
    forward "/", Absinthe.Plug, schema: InvestoreWeb.Schema

  end


  scope "/", InvestoreWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/auth", InvestoreWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

end
