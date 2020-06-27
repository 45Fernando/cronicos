defmodule Cronicos.MedicamentosTest do
  use Cronicos.DataCase

  alias Cronicos.Medicamentos

  describe "medicamentos" do
    alias Cronicos.Medicamentos.Medicamento

    @valid_attrs %{drogas: "some drogas", nombre: "some nombre", presentacion: "some presentacion"}
    @update_attrs %{drogas: "some updated drogas", nombre: "some updated nombre", presentacion: "some updated presentacion"}
    @invalid_attrs %{drogas: nil, nombre: nil, presentacion: nil}

    def medicamento_fixture(attrs \\ %{}) do
      {:ok, medicamento} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medicamentos.create_medicamento()

      medicamento
    end

    test "list_medicamentos/0 returns all medicamentos" do
      medicamento = medicamento_fixture()
      assert Medicamentos.list_medicamentos() == [medicamento]
    end

    test "get_medicamento!/1 returns the medicamento with given id" do
      medicamento = medicamento_fixture()
      assert Medicamentos.get_medicamento!(medicamento.id) == medicamento
    end

    test "create_medicamento/1 with valid data creates a medicamento" do
      assert {:ok, %Medicamento{} = medicamento} = Medicamentos.create_medicamento(@valid_attrs)
      assert medicamento.drogas == "some drogas"
      assert medicamento.nombre == "some nombre"
      assert medicamento.presentacion == "some presentacion"
    end

    test "create_medicamento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medicamentos.create_medicamento(@invalid_attrs)
    end

    test "update_medicamento/2 with valid data updates the medicamento" do
      medicamento = medicamento_fixture()
      assert {:ok, %Medicamento{} = medicamento} = Medicamentos.update_medicamento(medicamento, @update_attrs)
      assert medicamento.drogas == "some updated drogas"
      assert medicamento.nombre == "some updated nombre"
      assert medicamento.presentacion == "some updated presentacion"
    end

    test "update_medicamento/2 with invalid data returns error changeset" do
      medicamento = medicamento_fixture()
      assert {:error, %Ecto.Changeset{}} = Medicamentos.update_medicamento(medicamento, @invalid_attrs)
      assert medicamento == Medicamentos.get_medicamento!(medicamento.id)
    end

    test "delete_medicamento/1 deletes the medicamento" do
      medicamento = medicamento_fixture()
      assert {:ok, %Medicamento{}} = Medicamentos.delete_medicamento(medicamento)
      assert_raise Ecto.NoResultsError, fn -> Medicamentos.get_medicamento!(medicamento.id) end
    end

    test "change_medicamento/1 returns a medicamento changeset" do
      medicamento = medicamento_fixture()
      assert %Ecto.Changeset{} = Medicamentos.change_medicamento(medicamento)
    end
  end
end
