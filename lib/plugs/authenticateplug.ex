defmodule Cronicos.AuthenticatePlug do
  @moduledoc """
  This plug ensures that a user is login,if not redirect to the login.

  Probablemente no necesite este plug, la libreria Pow me provee uno actualmente
  """
  import Plug.Conn, only: [halt: 1]
  use CronicosWeb, :controller

  alias CronicosWeb.Router.Helpers, as: Routes
  #alias Phoenix.Controller
  #alias Plug.Conn
  alias Pow.Plug


  def init(config), do: config

  def call(conn, _paramss) do
    conn
    |> Plug.current_user()
    |> authenticate(conn)
  end

  def authenticate(current_user, conn) do
    IO.inspect(current_user, label: "USUARIO POR ACA")
    case current_user do
      nil -> conn
              |> put_flash(:error, "Debe haber iniciado sesion")
              |> redirect(to: Routes.pow_session_path(conn, :new))
              |> halt()

        _ -> conn
    end
  end
end
