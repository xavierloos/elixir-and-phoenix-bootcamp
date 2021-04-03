defmodule Discuss.TopicController do
  # alias // Does NOT modify the current module to hace access to functions, instead makes a link to it when call.
  # import // Copy and paste the functions from another module
  use DiscussWeb, :controller
  alias Discuss.Topic

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html", changeset: changeset
  end
end