defmodule WordleWeb.PageLive do
  use WordleWeb, :live_view

  alias WordleWeb.Live.Components.Word

  @words_list ["piano"]

  def handle_params(_params, _uri, socket) do
    {:noreply,
     assign(socket,
       guesses: [],
       secret_word: secret_word(),
       won?: false
     )}
  end

  def handle_info({:add_guess, guess}, socket) do
    if guess == socket.assigns.secret_word do
      socket =
        socket
        |> assign(guesses: socket.assigns.guesses ++ [guess], won?: true)
        |> push_event("won", %{})

      {:noreply, socket}
    else
      {:noreply, assign(socket, guesses: socket.assigns.guesses ++ [guess])}
    end
  end

  defp secret_word() do
    random_num = Enum.random(0..(length(@words_list) - 1))
    @words_list |> Enum.at(random_num)
  end
end
