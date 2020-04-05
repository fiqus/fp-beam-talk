defmodule Recursion do
  def factorial(0) do
    1
  end

  def factorial(n) do
    n * factorial(n-1)
  end
end

IO.puts "factorial result: #{Recursion.factorial(10)}"
