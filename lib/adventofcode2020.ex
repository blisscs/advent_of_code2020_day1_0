defmodule Adventofcode2020 do
  def read(filename) do
    path = Path.join(:code.priv_dir(:adventofcode2020), filename)

    File.read(path)
  end
end
