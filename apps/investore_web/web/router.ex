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
