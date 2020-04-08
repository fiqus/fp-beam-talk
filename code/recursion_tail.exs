defmodule Recursion do
  # factorial using tail recursion
  def factorial_tail(n) do
    factorial_tail(n, 1)
  end

  defp factorial_tail(0, accum) do
    accum
  end

  defp factorial_tail(n, accum) do
    factorial_tail(n - 1, n * accum)
  end
end

IO.puts "factorial tail-recursion result: #{Recursion.factorial_tail(10)}"
