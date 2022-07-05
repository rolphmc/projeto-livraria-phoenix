defmodule LivrariaPhoenixWeb.SubcategoriesView do
  use LivrariaPhoenixWeb, :view

  def subcategory_select_options(subcategories) do
    for subcategory <- subcategories, do: {subcategory.subcategory, subcategory.id}
  end

end
