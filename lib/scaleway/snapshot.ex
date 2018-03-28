defmodule Scaleway.Snapshot do
  import Scaleway, only: [get: 1, post: 2, put: 2, delete: 1, format_answer: 1, extract_body: 1]

  @moduledoc """
  A snapshot is a full-volume copy stored in our secure data centers.

  [Scaleway documentation API for snapshots](https://developer.scaleway.com/#snapshots)
  """

  @endpoint "/snapshots"

  @doc """
  Create a snapshot.

  ## Examples
      iex> data = %{
        :name => "snapshot-0-1",
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :volume_id => "701a8946-ff9d-4579-95e3-1c2c2d0f892d"
      }
      %{
        :name => "snapshot-0-1",
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :volume_id => "701a8946-ff9d-4579-95e3-1c2c2d0f892d"
      }

      iex> Scaleway.Snapshot.create(data)
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
  List all snapshots.

  ## Examples
      iex> Scaleway.Snapshot.list()
  """
  @spec list() :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list() do
    get(@endpoint) 
  end
  @spec list!() :: map()
  def list!() do
    list()
    |> format_answer
    |> extract_body
  end

  @doc """
  Retrieve a snapshot by its id.

  ## Examples
      iex> snapshot_id = "6f418e5f-b42d-4423-a0b5-349c74c454a4"
      "6f418e5f-b42d-4423-a0b5-349c74c454a4"

      iex> Scaleway.Snapshot.show(snapshot_id)
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
  Update a snapshot by its id.

  ## Examples
      iex> snapshot_id = "6f418e5f-b42d-4423-a0b5-349c74c454a4"
      "6f418e5f-b42d-4423-a0b5-349c74c454a4"

      iex> data = %{:name => "snapshot-0-1"}
      %{:name => "snapshot-0-1"}

      iex> Scaleway.Snapshot.update(snapshot_id, data)
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
  Remove a snapshot by its id.

  ## Examples
      iex> snapshot_id = "6f418e5f-b42d-4423-a0b5-349c74c454a4"
      "6f418e5f-b42d-4423-a0b5-349c74c454a4"

      iex> Scaleway.Snapshot.remove(snapshot_id)
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
