defmodule ScbEx do
  @moduledoc """
  Documentation for `ScbEx`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ScbEx.hello()
      :world

  """
  def hello do
    :world
  end

  START__BE__BE0101__BE0101A
  START__BE__BE0101__BE0101A

  @answers [
    "It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes, definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    "Reply hazy try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"
  ]

  def ask(_question) do
    @answers |> Enum.shuffle |> List.first
  end
end
