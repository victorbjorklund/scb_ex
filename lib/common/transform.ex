defmodule ScbEx.Common.Transform do
    def format_query(schema) do
        lookup_table = %{
          "region" => "vs:RegionKommun07",
          "alder" => "vs:Ålder1årA"
        }
    
        Enum.map(schema, fn {key, values} ->
          %{
            code: String.capitalize(to_string(key)),
            selection: %{
              filter: lookup_table[to_string(key)],
              values: Enum.map(values, &to_string/1)
            }
          }
        end)
      end
  end
  