defmodule LivrariaPhoenixWeb.Router do
  use LivrariaPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LivrariaPhoenixWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LivrariaPhoenixWeb.Auth # Autenticação Criada
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LivrariaPhoenixWeb do
    pipe_through [:browser]

    #manual
    get "/books/new", BooksController, :new
    get "/books", BooksController, :index
    get "/books/:id", BooksController, :show
    post "/books", BooksController, :create

    #automáticos
    get "/", PageController, :index

    #recursos
    resources "/subcategories", SubcategoriesController, only: [:index, :create]
    resources "/categories", CategoriesController, only: [:index, :create]
    resources "/customers", CustomersController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionsController, only: [:new, :create, :delete]
    # new -> chamar form login
    # create -> metod post para fazer login
    # delete -> deslogar

  end

  # Other scopes may use custom stacks.
  # scope "/api", LivrariaPhoenixWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LivrariaPhoenixWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Bamboo.SentEmailViewerPlug
    end
  end
end
