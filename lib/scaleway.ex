defmodule Scaleway do
  @moduledoc """
  Documentation for elixir-scaleway.
  """

  use HTTPoison.Base

  defp get_token, do: Application.get_env(:scaleway, :api_token)

  defp get_region(), do: Application.get_env(:scaleway, :region)

  defp get_endpoint(), do: "https://cp-#{get_region()}.scaleway.com"

  defp process_url(path), do: "#{get_endpoint()}" <> path

  defp process_request_headers(headers) do
    [{"Content-type", "application/json"}, {"X-Auth-Token", "#{get_token()}"}] ++ headers
  end

  defp process_request_body(req), do: Poison.encode!(req)

  defp process_response_body(""), do: ""
  defp process_response_body(body), do: Poison.decode!(body, keys: :atoms)
end
