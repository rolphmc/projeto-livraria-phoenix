defmodule LivrariaPhoenix.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  alias LivrariaPhoenix.Books.Book
  alias LivrariaPhoenix.Sales.Order
  alias LivrariaPhoenix.Customers.Shelf

  @fields [:email, :name, :username, :encrypted_password]

  schema "customers" do
    field :email, :string
    field :encrypted_password, :string
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true

    # relações
    has_one :shelf, Shelf
    has_many :orders, Order
    many_to_many :book, Book, join_through: "shopping_carts"

    timestamps()
  end

  @doc false
  def changeset(customer, params) do
    customer
    |> cast(params, @fields)
    |> validate_required(@fields)
  end

  def register_changeset(customer, params) do
    customer
    |> cast(params, [:password, :email, :username, :name])
    |> validate_required([:password, :email, :username, :name])
    |> validate_length(:password, min: 4)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:username)
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/)
    |> validate_length(:username, min: 4, max: 25)
    |> put_pass_hash()

  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :encrypted_password, Pbkdf2.hash_pwd_salt(pass))

        _ ->
        changeset
    end
  end
end
