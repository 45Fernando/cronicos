defmodule CronicosWeb.PageController do
  use CronicosWeb, :controller

  def index(conn, _params) do
    #render(conn, "index.html")
    redirect(conn, to: Routes.user_path(conn, :index))
  end
end
