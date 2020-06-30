defmodule CronicosWeb.PedidoController do
  use CronicosWeb, :controller

  alias Cronicos.Pedidos
  alias Cronicos.Pedidos.Pedido

  def index(conn, _params) do
    pedidos = Pedidos.list_pedidos()
    render(conn, "index.html", pedidos: pedidos)
  end

  def new(conn, params) do
    IO.inspect(params, label: "PARAMETROS DE PEDIDO")
    changeset = Pedidos.change_pedido(%Pedido{})
    render(conn, "new.html", changeset: changeset, user: params)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, pedido_params) do
    case Pedidos.create_pedido(pedido_params) do
      {:ok, pedido} ->
        conn
        |> put_flash(:info, "Cronico creado exitosamente.")
        |> redirect(to: Routes.user_path(conn, :show, pedido.user_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pedido = Pedidos.get_pedido!(id)
    render(conn, "show.html", pedido: pedido)
  end

  def edit(conn, %{"id" => id}) do
    pedido = Pedidos.get_pedido!(id)
    changeset = Pedidos.change_pedido(pedido)
    render(conn, "edit.html", pedido: pedido, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pedido" => pedido_params}) do
    pedido = Pedidos.get_pedido!(id)

    case Pedidos.update_pedido(pedido, pedido_params) do
      {:ok, pedido} ->
        conn
        |> put_flash(:info, "Cronico updated successfully.")
        |> redirect(to: Routes.pedido_path(conn, :show, pedido))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pedido: pedido, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pedido = Pedidos.get_pedido!(id)
    {:ok, _pedido} = Pedidos.delete_pedido(pedido)

    conn
    |> put_flash(:info, "Cronico borrado exitosamente.")
    |> redirect(to: Routes.user_path(conn, :show, pedido.user_id))
  end
end
