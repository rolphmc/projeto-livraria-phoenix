defmodule LivrariaPhoenix.BooksTest do
  use LivrariaPhoenix.DataCase

  alias LivrariaPhoenix.Books.Book

  describe "author" do
    alias LivrariaPhoenix.Books.Author

    @valid_input %{author_name: "qualquer nome"}
    @valid_update %{author_name: "nome atualizado"}
    @invalid_input %{author_name: nil}
  end
end
