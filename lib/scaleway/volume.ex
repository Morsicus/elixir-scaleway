defmodule Scaleway.Volume do
  import Scaleway, only: [get: 1, post: 2, delete: 1, format_answer: 1, extract_body: 1]

  @moduledoc """
  A Volume abstracts data storage operations for your servers in a flexible manner. volumes endpoint allow you to create, list or delete your volumes.

  [Scaleway documentation API for volumes](https://developer.scaleway.com/#volumes)
  """

  @endpoint "/volumes"

  @doc """
  Create a new volume

  ## Examples
      iex> data = %{
        :name => "volume-0-3",
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :size => 10000000000,
        :volume_type => "l_ssd"
      }
      %{
        :name => "volume-0-3",
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :size => 10000000000,
        :volume_type => "l_ssd"
      }

      iex> Scaleway.Volume.create(data)
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
  Retrieves all volumes

  ## Examples
      iex> Scaleway.Volume.list()
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
  Retrieves informations about a volume by its id

  ## Examples
      iex> volume_id = "f929fe39-63f8-4be8-a80e-1e9c8ae22a76"
      "f929fe39-63f8-4be8-a80e-1e9c8ae22a76"

      iex> Scaleway.Volume.show(volume_id)
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
  Delete a volume.

  ## Examples
      iex> volume_id = "f929fe39-63f8-4be8-a80e-1e9c8ae22a76"
      "f929fe39-63f8-4be8-a80e-1e9c8ae22a76"

      iex> Scaleway.Volume.remove(volume_id)
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

