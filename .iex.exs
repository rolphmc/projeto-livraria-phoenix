import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

#aliases globais
alias LivrariaPhoenix.Repo

#aliases de contexto
alias LivrariaPhoenix.{Books, Customers}

#aliases de structs
alias LivrariaPhoenix.Books.{Author, Book, CategoriesBooks,Category, Subcategory, LivrariaPhoenix.Books.CategoriesBooks}
alias LivrariaPhoenix.Customers.{Customer, Shelf}
alias LivrariaPhoenix.Sales.{Order, OrdersBooks, ShoppingCart}
