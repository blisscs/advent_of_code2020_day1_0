defmodule Adventofcode2020.Day1.Part1 do
  import Adventofcode2020, only: [read: 1]

  def solve() do
    {:ok, data} = read("day1.txt")

    list = String.trim(data)
           |> String.split("\n")
           |> Enum.map(&String.to_integer/1)

    {first_number, second_number} = 
      Enum.reduce_while(list, nil, fn first_number, acc -> 
        list = Enum.reject(list, & &1 == first_number)

        Enum.map(list,fn second_number -> {second_number, first_number + second_number} end)
        |> Enum.find(fn {_scond_number, sum} -> sum == 2020 end)
        |> case do
          nil -> {:cont, acc}
          {second_number, _} -> {:halt, {first_number, second_number}}
        end
      end)

    IO.puts first_number * second_number
  end
end
