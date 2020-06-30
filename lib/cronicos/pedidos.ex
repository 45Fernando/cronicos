defmodule Cronicos.Pedidos do
  @moduledoc """
  The Pedidos context.
  """

  import Ecto.Query, warn: false
  alias Cronicos.Repo

  alias Cronicos.Pedidos.Pedido

  @doc """
  Returns the list of pedidos.

  ## Examples

      iex> list_pedidos()
      [%Cronico{}, ...]

  """
  def list_pedidos do
    Repo.all(Pedido)
  end

  @doc """
  Gets a single pedidos.

  Raises `Ecto.NoResultsError` if the pedidos does not exist.

  ## Examples

      iex> get_pedidos!(123)
      %Cronico{}

      iex> get_cronico!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pedido!(id), do: Repo.get!(Pedido, id)

  @doc """
  Creates a cronico.

  ## Examples

      iex> create_cronico(%{field: value})
      {:ok, %Cronico{}}

      iex> create_cronico(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pedido(attrs \\ %{}) do
    %Pedido{}
    |> Pedido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cronico.

  ## Examples

      iex> update_cronico(cronico, %{field: new_value})
      {:ok, %Cronico{}}

      iex> update_cronico(cronico, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pedido(%Pedido{} = pedido, attrs) do
    pedido
    |> Pedido.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cronico.

  ## Examples

      iex> delete_cronico(cronico)
      {:ok, %Cronico{}}

      iex> delete_cronico(cronico)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pedido(%Pedido{} = pedido) do
    Repo.delete(pedido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cronico changes.

  ## Examples

      iex> change_cronico(cronico)
      %Ecto.Changeset{source: %Cronico{}}

  """
  def change_pedido(%Pedido{} = pedido) do
    Pedido.changeset(pedido, %{})
  end
end
