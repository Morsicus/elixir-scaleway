defmodule Scaleway.Server.Action do
  import Scaleway, only: [get: 1, post: 2, format_answer: 1, extract_body: 1]

  @moduledoc """
  [Scaleway documentation API for servers action](https://developer.scaleway.com/#servers-actions)
  """

  @endpoint "/servers"

  @doc """
  List all actions possible for a server by its id.

  ## Examples
      iex> server_id = "741db378-6b87-46d4-a8c5-4e46a09ab1f8"
      "741db378-6b87-46d4-a8c5-4e46a09ab1f8"

      iex> Scaleway.Server.Action.list(server_id)
  """
  @spec list(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list(id) do
    get("#{@endpoint}/#{id}/action")
  end
  @spec list!(charlist()) :: map()
  def list!(id) do
    list(id)
    |> format_answer
    |> extract_body
  end

  @doc """
  Execute an action on a server by its id.

  ## Examples
      iex> server_id = "741db378-6b87-46d4-a8c5-4e46a09ab1f8"
      "741db378-6b87-46d4-a8c5-4e46a09ab1f8"

      iex> Scaleway.Server.Action.execute(server_id, "poweroff")
  """
  @spec execute(charlist(), charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def execute(id, action) do
    data = %{:action => action}
    post("#{@endpoint}/#{id}/action", data)
  end
  @spec execute!(charlist(), charlist()) :: map()
  def execute!(id, action) do
    execute(id, action)
    |> format_answer
    |> extract_body
  end
end
