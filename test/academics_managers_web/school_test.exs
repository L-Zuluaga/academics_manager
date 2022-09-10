defmodule AcademicsManagers.SchoolTest do
  use AcademicsManagers.DataCase

  alias AcademicsManagers.School

  describe "signatures" do
    alias AcademicsManagers.School.Signature

    import AcademicsManagers.SchoolFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_signatures/0 returns all signatures" do
      signature = signature_fixture()
      assert School.list_signatures() == [signature]
    end

    test "get_signature!/1 returns the signature with given id" do
      signature = signature_fixture()
      assert School.get_signature!(signature.id) == signature
    end

    test "create_signature/1 with valid data creates a signature" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Signature{} = signature} = School.create_signature(valid_attrs)
      assert signature.description == "some description"
      assert signature.name == "some name"
    end

    test "create_signature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = School.create_signature(@invalid_attrs)
    end

    test "update_signature/2 with valid data updates the signature" do
      signature = signature_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Signature{} = signature} = School.update_signature(signature, update_attrs)
      assert signature.description == "some updated description"
      assert signature.name == "some updated name"
    end

    test "update_signature/2 with invalid data returns error changeset" do
      signature = signature_fixture()
      assert {:error, %Ecto.Changeset{}} = School.update_signature(signature, @invalid_attrs)
      assert signature == School.get_signature!(signature.id)
    end

    test "delete_signature/1 deletes the signature" do
      signature = signature_fixture()
      assert {:ok, %Signature{}} = School.delete_signature(signature)
      assert_raise Ecto.NoResultsError, fn -> School.get_signature!(signature.id) end
    end

    test "change_signature/1 returns a signature changeset" do
      signature = signature_fixture()
      assert %Ecto.Changeset{} = School.change_signature(signature)
    end
  end
end
