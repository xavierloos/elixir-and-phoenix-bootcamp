defmodule Discuss.TopicController do
  # alias // Does NOT modify the current module to hace access to functions, instead makes a link to it when call.
  # import // Copy and paste the functions from another module
  use DiscussWeb, :controller

  def new(conn, params) do
    IO.puts "++++"
    IO.inspect conn
    IO.puts "++++"
    IO.inspect params
    IO.puts "++++"
  end
end