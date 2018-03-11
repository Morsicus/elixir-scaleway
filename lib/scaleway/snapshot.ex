defmodule Scaleway.Snapshot do
  import Scaleway, only: [get: 1, format_answer: 1]

  def list() do
    get("/snapshots") |> format_answer
  end
end
