defmodule ArkadyWeb.Live.Book.Index do
  use ArkadyWeb, :live_view

  def mount(params, _, socket) do
    {:ok, socket}
  end

  def handle_params(params, _, socket) do
    socket = apply_action(socket, socket.assigns.live_action, params)

    {:noreply, socket}
  end

  defp apply_action(socket, :index, params) do
    # push_patch trigger error when the scope have an host
    #
    # to = Routes.book_index_path(%URI{host: "arkady.local", scheme: "http", port: 4000}, :show, 123)
    to = Routes.book_index_path(socket, :show, 123)
    push_patch(socket, to: to, replace: true)
    # work when the scope have an host
    # push_redirect(socket, to: Routes.book_index_path(socket, :show, 123), replace: true)
  end

  defp apply_action(socket, :show, params) do
    socket
  end

  def render(assigns) do
    ~H"""
    <div><%= @live_action %></div>
    """
  end
end
