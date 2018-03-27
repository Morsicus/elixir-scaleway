defmodule Scaleway.Server do
  import Scaleway, only: [get: 1, post: 2, put: 2, delete: 1, format_answer: 1, extract_body: 1]

  @moduledoc """
  A Server is a dedicated machine for your own use. servers endpoint allow you to create, list or delete your servers.

  [Scaleway documentation API for servers](https://developer.scaleway.com/#servers-servers)
  """

  @endpoint "/servers"

  @doc """
  Create a new server.

  ## Examples
      iex> data = %{
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :name => "my_server",
        :image => "85917034-46b0-4cc5-8b48-f0a2245e357e",
        :commercial_type => "VC1S",
        :tags => [
          "test",
          "www"
        ],
        :enable_ipv6 => true
      }
      %{
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :name => "my_server",
        :image => "85917034-46b0-4cc5-8b48-f0a2245e357e",
        :commercial_type => "VC1S",
        :tags => [
          "test",
          "www"
        ],
        :enable_ipv6 => true
      }

      iex> Scaleway.Server.create(data)
  """
  @spec create(map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def create(data) do
    post(@endpoint, data)
  end
  @spec create!(map()) :: map()
  def create!(data) do
    create(data)
    |> format_answer
    |> extract_body
  end

  @doc """
  List all servers.

  ## Examples
      iex> Scaleway.Server.list()
  """
  @spec list() :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list() do
    get(@endpoint)
  end

  @doc """
  Similar to list/0 but with the body only.
  """
  @spec list!() :: map()
  def list!() do
    list()
    |> format_answer
    |> extract_body
  end

  @doc """
  Retrieve informations on a specific server by its id.

  ## Examples
      iex> server_id = "741db378-6b87-46d4-a8c5-4e46a09ab1f8"
      "741db378-6b87-46d4-a8c5-4e46a09ab1f8"

      iex> Scaleway.Server.show(server_id)
  """
  @spec show(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def show(id) do
    get("#{@endpoint}/#{id}")
  end
  @spec show!(charlist()) :: map()
  def show!(id) do
    show(id)
    |> format_answer
    |> extract_body
  end

  @doc """
  Update informations on a specific server by its id.
  """
  @spec update(charlist(), map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def update(id, data) do
    put("#{@endpoint}/#{id}", data)
  end
  @spec update!(charlist(), map()) :: map()
  def update!(id, data) do
    update(id, data)
    |> format_answer
    |> extract_body
  end

  @doc """
  Remove a specific server by its id.

  ## Examples
      iex> server_id = "741db378-6b87-46d4-a8c5-4e46a09ab1f8"
      "741db378-6b87-46d4-a8c5-4e46a09ab1f8"

      iex> Scaleway.Server.remove(server_id)
  """
  @spec remove(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def remove(id) do
    delete("#{@endpoint}/#{id}")
  end
  @spec remove!(charlist()) :: map()
  def remove!(id) do
    remove(id)
    |> format_answer
    |> extract_body
  end
end
