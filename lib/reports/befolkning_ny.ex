defmodule ScbEx.Reports.Report do
  @url "https://api.scb.se/OV0104/v1/doris/sv/ssd/START/BE/BE0101/BE0101A/BefolkningNy"
  def schema do
    [
      region: [
        type: {:list, {:custom, ScbEx.Common.Validations, :valid_region, []}},
        required: false
      ],
      alder: [
        type: {:list, {:in, [1..100]}},
        required: false
      ],
      kon: [
        type: {:list, {:in, [1,2]}},
        required: false
      ],
      tid: [
        type: {:list, {:in, [1968..2024]}},
        required: false
      ],
    ]
  end

  def get(query) do
    schema = schema()

    case ScbEx.Common.Validations.validate(query, schema) do
      {:error, error} -> {:error, error}
      {:ok, query} -> formatted_query = ScbEx.Common.Transform.format_query(query)
        ScbEx.Common.API.build_and_fetch(@url, formatted_query) 
    end
  end
end
