defmodule CronicosWeb.PageController do
  use CronicosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
