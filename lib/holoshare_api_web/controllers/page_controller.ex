defmodule HoloshareApiWeb.PageController do
  use HoloshareApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
