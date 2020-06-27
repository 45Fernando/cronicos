defmodule CronicosWeb.MedicamentoController do
  use CronicosWeb, :controller

  alias Cronicos.Medicamentos
  alias Cronicos.Medicamentos.Medicamento

  def index(conn, _params) do
    medicamentos = Medicamentos.list_medicamentos()
    render(conn, "index.html", medicamentos: medicamentos)
  end

  def new(conn, _params) do
    changeset = Medicamentos.change_medicamento(%Medicamento{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"medicamento" => medicamento_params}) do
    case Medicamentos.create_medicamento(medicamento_params) do
      {:ok, medicamento} ->
        conn
        |> put_flash(:info, "Medicamento created successfully.")
        |> redirect(to: Routes.medicamento_path(conn, :show, medicamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    medicamento = Medicamentos.get_medicamento!(id)
    render(conn, "show.html", medicamento: medicamento)
  end

  def edit(conn, %{"id" => id}) do
    medicamento = Medicamentos.get_medicamento!(id)
    changeset = Medicamentos.change_medicamento(medicamento)
    render(conn, "edit.html", medicamento: medicamento, changeset: changeset)
  end

  def update(conn, %{"id" => id, "medicamento" => medicamento_params}) do
    medicamento = Medicamentos.get_medicamento!(id)

    case Medicamentos.update_medicamento(medicamento, medicamento_params) do
      {:ok, medicamento} ->
        conn
        |> put_flash(:info, "Medicamento updated successfully.")
        |> redirect(to: Routes.medicamento_path(conn, :show, medicamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", medicamento: medicamento, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    medicamento = Medicamentos.get_medicamento!(id)
    {:ok, _medicamento} = Medicamentos.delete_medicamento(medicamento)

    conn
    |> put_flash(:info, "Medicamento deleted successfully.")
    |> redirect(to: Routes.medicamento_path(conn, :index))
  end
end
