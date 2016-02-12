defmodule Rubl.Router do
  use Rubl.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Rubl do
    pipe_through :browser # Use the default browser stack

    resources "/schools", SchoolController, only: [:index, :show, :new, :create]
    resources "/users", UserController, only: [:index, :show, :new, :create]
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Rubl do
  #   pipe_through :api
  # end
end
