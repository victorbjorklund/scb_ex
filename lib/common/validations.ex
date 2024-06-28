defmodule ScbEx.Common.Validations do
  @valid_regions ["0114"]

  def valid_region(region) when region in @valid_regions, do: {:ok, region}
  def valid_region(region), do: {:error, "invalid region: #{region}"}

  # def schema do
  #   [
  #     regions: [
  #       type: {:list, {:custom, __MODULE__, :valid_region, []}},
  #       required: true,
  #       doc: "A list of regions"
  #     ]
  #   ]
  # end

  def validate(query, schema) when is_map(query) do
    # Convert the map to a keyword list
    keyword_query = Enum.into(query, [])
    IO.inspect(1)
    validate(keyword_query, schema)
  end

  def validate(query, schema) when is_list(query) do
    IO.inspect(2)
    IO.inspect(query)
    IO.inspect(schema)
    NimbleOptions.validate(query, schema)
  end
end
