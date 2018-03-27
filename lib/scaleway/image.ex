defmodule Scaleway.Image do
  import Scaleway, only: [get: 1, post: 2, put: 2, delete: 1, format_answer: 1, extract_body: 1]

  @moduledoc """
  Images allow you to create series of servers with predefined configuration.
  For instance, you can prepare to scale your serving capacity with a frontend image for an Apache server.

  [Scaleway documentation API for images](https://developer.scaleway.com/#images)
  """

  @endpoint "/images"

  @doc """
  Create a new image.

  ## Examples
      iex> data = %{
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :arch => "arm",
        :name => "my_image",
        :root_volume => "f0361e7b-cbe4-4882-a999-945192b7171b"
      }
      %{
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :arch => "arm",
        :name => "my_image",
        :root_volume => "f0361e7b-cbe4-4882-a999-945192b7171b"
      }

      iex> Scaleway.Image.create(data)
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
  List all images.

  ## Examples
      iex> Scaleway.Image.list()
  """
  @spec list() :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list() do
    get(@endpoint)
  end

  @doc """
  Similar to list/0 but with body only.
  """
  @spec list!() :: map()
  def list!() do
    list()
    |> format_answer
    |> extract_body
  end

  @doc """
  Retrieves an image by its id.

  ## Examples
      iex> image_id = "98bf3ac2-a1f5-471d-8c8f-1b706ab57ef0"
      "98bf3ac2-a1f5-471d-8c8f-1b706ab57ef0"

      iex> Scaleway.Image.show(image_id)
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
  Update an image
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
  Delete an image by its id.

  ## Examples
      iex> image_id = "98bf3ac2-a1f5-471d-8c8f-1b706ab57ef0"
      "98bf3ac2-a1f5-471d-8c8f-1b706ab57ef0"

      iex> Scaleway.Image.remove(image_id)
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
