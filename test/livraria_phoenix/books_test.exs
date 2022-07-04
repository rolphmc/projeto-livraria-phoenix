defmodule LivrariaPhoenix.BooksTest do
  use LivrariaPhoenix.DataCase, async: true

  alias LivrariaPhoenix.Books
  alias LivrariaPhoenix.Books.Category

  # #########################
  #                Categories
  # #########################

  describe "create_category/1" do
    @valid_params %{category: "Testando"}

    @invalid_params %{}

    test "cria categoria com nome válido" do
      assert {:ok, %Category{}=category} = Books.create_category(@valid_params)
      assert category.category == "Testando"
    end
  end
end
