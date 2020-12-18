defmodule Adventofcode2020.Day1.Part2 do
  import Adventofcode2020, only: [read: 1]

  def solve() do
    {:ok, data} = read("day1.txt")

    list = String.trim(data)
           |> String.split("\n")
           |> Enum.map(&String.to_integer/1)

    {first_number, second_number, third_number} = 
      Enum.reduce_while(list, nil, fn first_number, acc -> 
        list = Enum.reject(list, & &1 == first_number)

        Enum.reduce_while(list, nil, fn second_number, acc -> 
          two_number_sum = first_number + second_number

          list = Enum.reject(list, & &1 == second_number)

          Enum.map(list, fn third_number -> {third_number, two_number_sum + third_number} end)
          |> Enum.find(fn {_third_number, three_number_sum} -> three_number_sum == 2020 end)
          |> case do
            nil -> {:cont, acc}
            {third_number, _} -> {:halt, {first_number, second_number, third_number}}
          end
        end)
        |> case do
          ^acc -> {:cont, acc}
          {_first_number, _second_number, _third_number} = result -> {:halt, result}
        end
      end)

    IO.puts first_number * second_number * third_number
  end
end
