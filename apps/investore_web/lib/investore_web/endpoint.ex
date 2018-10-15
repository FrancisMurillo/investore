defmodule InvestoreWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :investore_web

  socket("/socket", InvestoreWeb.UserSocket)

  plug(Plug.Static,
    at: "/",
    from: :investore_web,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
  )

  if code_reloading? do
    socket("/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket)
    plug(Phoenix.LiveReloader)
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  plug(Plug.Session,
    store: :cookie,
    key: "_investore_web_key",
    signing_salt: "uW0gLJCa"
  )

  plug(InvestoreWeb.Router)
end
