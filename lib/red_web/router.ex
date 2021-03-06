defmodule RedWeb.Router do
  use RedWeb, :router

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

  scope "/", RedWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/ping", PingController, :index
    get "/playground", PlaygroundController, :index
    get "/ed", EditorController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RedWeb do
  #   pipe_through :api
  # end
end
