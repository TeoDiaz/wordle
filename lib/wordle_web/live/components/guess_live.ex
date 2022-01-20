defmodule WordleWeb.Live.Components.GuessLive do
  use WordleWeb, :live_component
 
  def update(_assigns, socket) do
    {:ok, assign(socket, actual_guesses: ["", "", "", "", ""])}
  end

  def handle_event(
        guess,
        %{"value" => value},
        %{assigns: %{actual_guesses: actual_guess}} = socket
      ) do
    ["guess", position_id] = String.split(guess, "_")
    position_id = position_id |> String.to_integer()

    new_guess = actual_guess |> List.replace_at(position_id, value)

    case Enum.member?(new_guess, "") do
      false ->
        send(self(), {:add_guess, Enum.join(new_guess)})
        
        {:noreply, assign(socket, actual_guesses: ["", "", "", "", ""]) |> push_event("guesses_reset", %{})}

      true ->
        {:noreply, assign(socket, actual_guesses: new_guess)}
    end
  end
end
