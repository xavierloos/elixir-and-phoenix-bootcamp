defmodule Discuss.Topic do
  used DiscussWeb, :model

  schema "topics" do
    field :title, :string
  end
end