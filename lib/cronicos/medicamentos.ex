defmodule Cronicos.Medicamentos do
  @moduledoc """
  The Medicamentos context.
  """

  import Ecto.Query, warn: false
  alias Cronicos.Repo

  alias Cronicos.Medicamentos.Medicamento

  @doc """
  Returns the list of medicamentos.

  ## Examples

      iex> list_medicamentos()
      [%Medicamento{}, ...]

  """
  def list_medicamentos do
    Repo.all(Medicamento)
  end

  @doc """
  Gets a single medicamento.

  Raises `Ecto.NoResultsError` if the Medicamento does not exist.

  ## Examples

      iex> get_medicamento!(123)
      %Medicamento{}

      iex> get_medicamento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_medicamento!(id), do: Repo.get!(Medicamento, id)

  @doc """
  Creates a medicamento.

  ## Examples

      iex> create_medicamento(%{field: value})
      {:ok, %Medicamento{}}

      iex> create_medicamento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_medicamento(attrs \\ %{}) do
    %Medicamento{}
    |> Medicamento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a medicamento.

  ## Examples

      iex> update_medicamento(medicamento, %{field: new_value})
      {:ok, %Medicamento{}}

      iex> update_medicamento(medicamento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_medicamento(%Medicamento{} = medicamento, attrs) do
    medicamento
    |> Medicamento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a medicamento.

  ## Examples

      iex> delete_medicamento(medicamento)
      {:ok, %Medicamento{}}

      iex> delete_medicamento(medicamento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_medicamento(%Medicamento{} = medicamento) do
    Repo.delete(medicamento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking medicamento changes.

  ## Examples

      iex> change_medicamento(medicamento)
      %Ecto.Changeset{source: %Medicamento{}}

  """
  def change_medicamento(%Medicamento{} = medicamento) do
    Medicamento.changeset(medicamento, %{})
  end
end
