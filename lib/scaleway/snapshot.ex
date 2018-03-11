defmodule Scaleway.Snapshot do
  import Scaleway, only: [get: 1]

  def list() do
    get("/snapshots")
  end
end
