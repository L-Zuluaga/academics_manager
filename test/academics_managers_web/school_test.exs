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

  describe "students" do
    alias AcademicsManagers.School.Student

    import AcademicsManagers.SchoolFixtures

    @invalid_attrs %{age: nil, email: nil, name: nil, semester: nil, student_code: nil}

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert School.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert School.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      valid_attrs = %{age: 42, email: "some email", name: "some name", semester: 42, student_code: "some student_code"}

      assert {:ok, %Student{} = student} = School.create_student(valid_attrs)
      assert student.age == 42
      assert student.email == "some email"
      assert student.name == "some name"
      assert student.semester == 42
      assert student.student_code == "some student_code"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = School.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      update_attrs = %{age: 43, email: "some updated email", name: "some updated name", semester: 43, student_code: "some updated student_code"}

      assert {:ok, %Student{} = student} = School.update_student(student, update_attrs)
      assert student.age == 43
      assert student.email == "some updated email"
      assert student.name == "some updated name"
      assert student.semester == 43
      assert student.student_code == "some updated student_code"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = School.update_student(student, @invalid_attrs)
      assert student == School.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = School.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> School.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = School.change_student(student)
    end
  end
end
