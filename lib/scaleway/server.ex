defmodule Scaleway.Server do
  import Scaleway, only: [get: 1, post: 2, delete: 1]

  @endpoint "/servers"

  def list() do
    get(@endpoint)
  end

  def create(data) do
    post(@endpoint, data)
  end 

  def remove(id) do
    delete("#{@endpoint}/#{id}")
  end
end
