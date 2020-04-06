# Welcome to fp_beam_talk!

---

# What is functional programming?

TODO

---

# Immutability
In Erlang:
!code code/immutability.erl erlang escript

In Elixir: 
TODO: show re-binding
---

# Pattern matching
intro
example

---

# Recursion
!code code/recursion.exs
TODO: add timers!

---

# Tail recursion
!code code/recursion_tail.exs
TODO: add timers!

---

# Lists
TODO: define, match [head | tail]

---

# High order functions
TODO: map, find, reduce

---

# List comprehension
TODO: show erlang and elixir

---

# Currification

---

# The BEAM
TODO: explain a little about actor model, processes, mailboxes, supervisors, etc

---

# Elixir

---

# Phoenix

---

# ExUnit

ExUnit is a test-unit based framework that ships with Elixir.

---

# Hex.pm

TODO: Package manager for the Erlang ecosystem.

---

# HexDocs

HexDocs is a place for Erlang/Elixir packages to host their documentation at https://hexdocs.pm  
The documentation is automatically published when you publish your package with `mix hex.publish`

!code code/hexdocs.exs

---

# Mix

Mix is a build tool that ships with Elixir that provides tasks for creating apps, compiling, releasing, testing, dependencies management and much more.  
It relies in the `mix.exs` file that defines all the project properties, including its dependencies.  
The file `mix.lock` will hold the freezed dependencies versions that can be upgraded with `mix deps.update`.

* Display help: `mix help` or `mix help deps.update` for a specific task
* Create a new project skeleton: `mix new my_project`
* Getting project dependencies: `mix deps.get`
* Compile project: `mix compile`
* Running tests: `mix test`
* Formatting the code: `mix format`
* Generating a release package: `mix release`
* Publish your code at hex.pm: `mix hex.publish`
* Start a Phoenix server: `mix phx.server` or `iex -S mix phx.server` for _interactive_ mode

---

# Useful Resources

### Books
* Elixir in Action: https://www.manning.com/books/elixir-in-action-second-edition
* Programming Elixir 1.6: https://pragprog.com/book/elixir16/programming-elixir-1-6
* Programming Phoenix 1.4: https://pragprog.com/book/phoenix14/programming-phoenix-1-4
* Metaprogramming Elixir: https://pragprog.com/book/cmelixir/metaprogramming-elixir

### Others
* Small exercises for Erlang: https://github.com/lambdaclass/erlings
* Weekly Email Newsletter at Elixir Radar: http://plataformatec.com.br/elixir-radar
* Code Sync YouTube channel: https://www.youtube.com/channel/UC47eUBNO8KBH_V8AfowOWOw

---

# Elixir repos from Fiqus =]

We love Elixir and had lots of fun creating some interesting open-source projects, come and see!

* **Prexent:** https://github.com/fiqus/prexent  
🎥 Fast, live and beautiful presentations from Markdown powered by Phoenix LiveView

* **Lambdex:** https://github.com/fiqus/lambdex  
Spawnfest 2018 project winner

* **Coophub:** https://github.com/fiqus/coophub  
Cooperatives repos over the world! 🌈🌎 (Elixir repos at: https://elixir.coophub.io/)

* **Surgex:** https://github.com/fiqus/surgex  
💉 Una app para cirugías / A surgeries elixir app

* **Live Qchatex:** https://github.com/fiqus/lqchatex  
Real-time web chat application using Phoenix LiveView + PubSub + Presence for sockets, Erlang's Mnesia for ETS and libcluster for cluster support

* **Narosky API:** https://github.com/fiqus/narosky_api  
The Fiqus bio species API 🐦 🌿
