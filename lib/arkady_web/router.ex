defmodule ArkadyWeb.Router do
  use ArkadyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ArkadyWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", ArkadyWeb, host: nil do
  #   pipe_through :browser

  #   live "/", Live.Book.Index, :index
  #   live "/:id", Live.Book.Index, :show
  # end

  scope "/", ArkadyWeb, host: "arkady.local" do
    pipe_through :browser

    live "/", Live.Book.Index, :index
    live "/:id", Live.Book.Index, :show
  end



  # Other scopes may use custom stacks.
  # scope "/api", ArkadyWeb do
  #   pipe_through :api
  # end
end
