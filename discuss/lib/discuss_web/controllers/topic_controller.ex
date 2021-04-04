defmodule Discuss.TopicController do
  # alias // Does NOT modify the current module to hace access to functions, instead makes a link to it when call.
  # import // Copy and paste the functions from another module
  use DiscussWeb, :controller
  alias DiscussWeb.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, post}-> IO.inspect(post)
      {:error, changeset} -> IO.inspect(changeset)
    end
  end 
end