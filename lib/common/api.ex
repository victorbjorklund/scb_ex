defmodule ScbEx.Common.API do
  def build_and_fetch(url, query) do



    body = %{
      query: query,
      response: %{
        format: "csv"
      }
    }

    %{body: body} =
      HTTPoison.post!(url, Jason.encode!(body), [{"Content-Type", "application/json"}])

    utf8_body = :iconv.convert("windows-1252", "utf-8", body)
    NimbleCSV.RFC4180.parse_string(utf8_body, skip_headers: false)
   
  end

  def clean_formatting(list) do
    list |> String.trim_leading("\"") |> String.trim_trailing("\"") |> String.split("\",\"")
  end
end
