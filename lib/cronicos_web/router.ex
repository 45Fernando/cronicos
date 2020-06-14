defmodule CronicosWeb.Router do
  use CronicosWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  #pipeline :authenticate do
  # esto probablemten no vaya
  #  plug Cronicos.AuthenticatePlug
  #end

  # BEGIN added for Pow
  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug Cronicos.EnsureRolePlug, :admin
  end

  scope "/" do
    pipe_through :browser

    pow_session_routes()
  end

  scope "/", CronicosWeb do
    pipe_through [:browser, :protected]

    get "/", PageController, :index
  end

  scope "/", Pow.Phoenix, as: "pow" do
    pipe_through [:browser, :protected]
    resources "/registration", RegistrationController, singleton: true, only: [:edit, :update, :delete]
  end

  scope "/admin", CronicosWeb do
    pipe_through [:browser, :protected, :admin]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CronicosWeb do
  #   pipe_through :api
  # end
end
