defmodule LivrariaPhoenixWeb.CategoriesView do
  use LivrariaPhoenixWeb, :view

  def category_select_options(categories) do
    for category <- categories, do: {category.category, category.id}
  end

end
