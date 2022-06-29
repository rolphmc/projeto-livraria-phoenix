import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

#aliases globais
alias LivrariaPhoenix.Repo

#aliases de contexto
alias LivrariaPhoenix.{Books, Customers}

#aliases de structs
alias LivrariaPhoenix.Books.{Author, Book, CategoriesBooks,Category, Subcategory}
alias LivrariaPhoenix.Customers.{Customer, Shelf}
alias LivrariaPhoenix.Sales.{Order, OrdersBooks, ShoppingCart}

#aliases utilitários
alias IO.puts(String.duplicate("#", 60)), as Marcador

defmodule AC do
  def update(schema, changes) do
    schema
    |> Ecto.Changeset.change(changes)
    |> Repo.update()
  end

  IEx.configure(
    colors: [
      syntax_colors: [
        number: :light_yellow,
        atom: :light_cyan,
        string: :light_black,
        boolean: [:light_blue],
        nil: [:magenta, :bright]
      ],
      ls_directory: :cyan,
      ls_device: :yellow,
      doc_code: :green,
      doc_inline_code: :magenta,
      doc_headings: [:cyan, :underline],
      doc_title: [:cyan, :bright, :underline]
    ],
    default_prompt:
      [
        # ANSI CHA, move cursor to column 1
        "\e[G",
        :light_magenta,
        # plain string
        "🧪 iex",
        ">",
        :white,
        :reset
      ]
      |> IO.ANSI.format()
      |> IO.chardata_to_string()
  )
end
