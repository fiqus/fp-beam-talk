!header Functional programming with Erlang/Elixir
!footer Fiqus - Cooperativa de Software
!custom_css slides.css

!slide_classes intro-slide
# Welcome to functional programming!
We will talk about **Functional Programming** principles and _prexent_ the **Erlang Ecosystem**, specially **Elixir**!  
<br />
<br />
![Image](img/github.png) 
[https://github.com/fiqus/fp-beam-talk/](https://github.com/fiqus/fp-beam-talk/)
<br />
<br />
| Pablo Brudnick| Diego Calero |
| pbrudnick@fiqus.coop | dcalero@fiqus.coop |
| [@pablobrud](https://twitter.com/pablobrud)   |         |

---

# What is functional programming?
FP is a paradigm for building software by:
* Taking functions as first-class citizens.
* Composing pure functions.
* Avoiding shared state, mutable data and side-effects.
* Declarative rather than imperative.

---

# Immutability
In Erlang:
!code code/immutability.erl erlang escript
⚠️ ```** exception error: no match of right hand side value "Elixir"```

In Elixir, once created, the data is immutable, but exists re-binding:
!code code/immutability.exs
---

# Pattern matching
### The match operator (=)
```elixir
iex> x = 1
1
iex> 1 = x
1
iex> 2 = x
** (MatchError) no match of right hand side value: 1
```

Can be used to match against complex data types (destructuring tuples, lists, etc):
```elixir
iex> {a, b, c} = {:hello, "world", 42}
{:hello, "world", 42}
iex> a
:hello
iex> b
"world"
```
---

# Pattern matching
### The match operator (=)
⚠️ Match error will occur if the sides can't be matched:
```elixir
iex> {a, b, c} = {:hello, "world"}
** (MatchError) no match of right hand side value: {:hello, "world"}
```

### The pin operator (^)
Use the pin operator `^` when you want to pattern match against an existing variable’s value rather than rebinding the variable:
```elixir
iex> x = 1
1
iex> {y, ^x} = {2, 1}
{2, 1}
iex> y
2
iex> {y, ^x} = {2, 2}
** (MatchError) no match of right hand side value: {2, 2}
```

---

# Recursion
The function calls itself until it matches an ending condition.
!code code/recursion.exs

---

# Tail recursion
Is a special case of recursion where the calling function doesn't run any more computations after making its recursive call.  
It avoids to push partial results to the call stack.
!code code/recursion_tail.exs

---

# Lists
They can contain any data type inside and they are one of the most used data structures.
```elixir
iex> [1, 2, true, 3]
[1, 2, true, 3]
iex> length([1, 2, 3])
3
iex> [1, 2, 3] ++ [4, 5, 6]
[1, 2, 3, 4, 5, 6]
iex> [1, true, 2, false, 3, true] -- [true, false]
[1, 2, 3, true]
```

Pattern match against lists:
```elixir
iex> [head | tail] = [1, 2, 3]
[1, 2, 3]
iex> head
1
iex> tail
[2, 3]
```
---

# Higher order functions
Any function which takes a function as an argument and can be applied over Functors, Lists and Streams.

### Enum.map/2
```elixir
iex> Enum.map([1, 2, 3], fn x -> x * 2 end)
[2, 4, 6]
iex> Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)
[2, 12]
```

### Enum.reduce/2-3
```elixir
iex> Enum.reduce([1, 2, 3, 4], fn x, acc -> x * acc end)
24
```
---

# List comprehension
Comprehensions are syntactic sugar for mappings.

### Erlang
```erlang
1> [X || X <- [1,2,a,3,4,b,5,6], X > 3].
[a,4,b,5,6]
2> [{X1, Y1} || X1 <- [1,2,3], Y1 <- [a,b]].
[{1,a},{1,b},{2,a},{2,b},{3,a},{3,b}]
```

### Elixir
```elixir
iex> for n <- 1..4, do: n * n
[1, 4, 9, 16]
```

---

# The BEAM
BEAM is the Erlang Virtual Machine, part of the Erlang Run-Time System (ERTS), which compiles Erlang and Elixir source code
into bytecode (.beam file extension), which is executed on the BEAM.

### Actor model
Actors (processes) <-> Messages (mailboxes)

> The Erlang view of the world is that everything is a process and that processes can interact only by exchanging messages.  (Joe Armstrong)

### Processes 

* Isolated from each other, run concurrent and communicate via message passing.
* Erlang/Elixir processes ARE NOT operative system processes, processes in the BEAM are extremely lightweight.
* We can have hundreds of thouthands of process running simultaneously.

---

# The BEAM
### Supervision trees
* Supervisors
* Workers

![Image](img/sup_tree.png)

All are processes!

---

# The BEAM
### Fault-tolerance
<br />
> "things will go wrong in production" (annonymous)
<br /> 
The BEAM provides supervisor **strategies** to describe HOW to restart processes:

* `one_for_one` - if a child process terminates, only that process is restarted.

* `one_for_all` - if a child process terminates, all other child processes are terminated and then all child processes (including the terminated one) are restarted.

* `rest_for_one` - if a child process terminates, the terminated child process and the rest of the children started after it, are terminated and restarted.
---

# Elixir
> ![Image](img/elixir_logo.png)
<br />
Dynamic functional language designed for building scalable and maintainable applications.

Elixir leverages the Erlang VM, known for running **low-latency**, **distributed** and **fault-tolerant** systems, while also being successfully used in web development and the embedded software domain.

Created by **José Valim** in 2011. 💜

GitHub: [https://github.com/elixir-lang](https://github.com/elixir-lang)

---

# Elixir
> ![Image](img/elixir_logo.png)

There are lot of _great_ abstractions that Elixir uses from Erlang/OTP:

* application
* supervisor
* gen_server
* gen_event
* behaviours
* ETS
* Umbrella apps
* ..etc

And there's another Elixir-specific functionality -> _macros_ ... ![Image](img/mind_blowing.gif)

---
!slide_classes dark-slide
!slide_background img/think_meme.gif

So, if you learn **Erlang**...
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
you will learn the **Elixir**'s bases! <small>(and vice-versa)</small>

---

# Phoenix Framework
> ![Image](img/phoenix_logo.png)
<br />
The Elixir Web Framework!

* `Views/Templating`
* `Ecto` - query and database wrapper with migrations
* `API`
* `Channels` - websockets
* `Generators` (HTML and json) - generate the models, views, etc.
* `PubSub` - subscriptions to topics (used by Channels broadcasts)
* `LiveView` - **New** functionality for front-end on top of Channels! 🎉

[https://www.phoenixframework.org/](https://www.phoenixframework.org/)

[Phoenix HexDocs](https://hexdocs.pm/phoenix/Phoenix.html)
---

# ExUnit

ExUnit is a test-unit based framework that ships with Elixir ✅

!code code/ex_unit.exs

---

![Hexpm](/img/hexpm.png#float-right)
# Hex.pm

### Package manager for the Erlang/Elixir ecosystem.  
Allows you to publish your packages so they can be easily included as dependency in other projects.

1. Register a Hex user: `mix hex.user register`.
2. Publish your package: `mix hex.publish`.
3. Include your package as a dependency:
* `{:prexent, "~> 0.2"}` will use the latest version at `0.2.0` or above, and below `0.3.0`.
* `{:prexent, "0.2.5"}` will use the fixed/pinned version at `0.2.5`.
* `{:prexent, github: "fiqus/prexent"}` will use `github` repo at `master` branch instead of `hex.pm`.

---

![Hexpm](/img/hexpm.png#float-right)
# HexDocs

HexDocs is a place for Erlang/Elixir packages to host their documentation at https://hexdocs.pm  
The documentation is automatically published when you publish your package with `mix hex.publish`

```elixir
defmodule MyApp.Hello do
  @moduledoc """
  This is the Hello module.
  """
  @moduledoc since: "1.0.0"

  @doc """
  Says hello to the given `name`.
  Returns `:ok`.

  ## Examples

      iex> MyApp.Hello.world(:john)
      :ok

  """
  @doc since: "1.3.0"
  def world(name), do: IO.puts("hello #{name}")
end
```

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

# Useful examples:

* Umbrella apps: https://github.com/fiqus/lambdex/tree/master/apps  
`$ mix new my_project --umbrella` and then inside `my_project/apps` you can create projects using `mix new...`.

* Supervision tree setup: https://github.com/fiqus/coophub/blob/master/lib/coophub/application.ex#L15-L40  
Placed in the application file.

* Behaviours: https://github.com/fiqus/coophub/blob/master/lib/coophub/backends/backends.ex 

* Ecto schema: https://github.com/fiqus/surgex/blob/master/lib/surgex/surgeries/surgery.ex  

* Prexent HexDocs: https://hexdocs.pm/prexent/api-reference.html  

* Pipe operator `|>`: https://github.com/fiqus/coophub/blob/master/lib/coophub_web.ex#L29-L34

* Phoenix LiveView: https://github.com/fiqus/prexent/blob/master/lib/prexent_web/live/slides.ex  
This slides are using that.

* Phoenix LiveView examples (Phoenix Phrenzy winners) https://phoenixphrenzy.com/results

---

# Elixir repos from Fiqus =]

We love Elixir and had lots of fun creating some interesting open-source projects, come and see!

* **Prexent:** https://github.com/fiqus/prexent (This presentation was created with this! ❤️)  
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

---

# Useful Resources

### Books 📚
* Elixir in Action: https://www.manning.com/books/elixir-in-action-second-edition
* Programming Elixir 1.6: https://pragprog.com/book/elixir16/programming-elixir-1-6
* Programming Phoenix 1.4: https://pragprog.com/book/phoenix14/programming-phoenix-1-4
* Metaprogramming Elixir: https://pragprog.com/book/cmelixir/metaprogramming-elixir
* Learn you some Erlang: https://learnyousomeerlang.com/
* Erlang in Anger: https://www.erlang-in-anger.com/
* Property-Based Testing with PropEr, Erlang, and Elixir: https://propertesting.com/

### Others
* Small FP exercises with Erlang: https://github.com/lambdaclass/erlings
* Weekly Email Newsletter at Elixir Radar: http://plataformatec.com.br/elixir-radar
* Code Sync YouTube channel: https://www.youtube.com/channel/UC47eUBNO8KBH_V8AfowOWOw
* Phoenix LiveView: https://dockyard.com/blog/2018/12/12/phoenix-liveview-interactive-real-time-apps-no-need-to-write-javascript

---

# Sources

* https://elixir-lang.org/getting-started/introduction.html
* https://hexdocs.pm/phoenix/Phoenix.html
* https://hex.pm/


---

# Thank you! 👋
