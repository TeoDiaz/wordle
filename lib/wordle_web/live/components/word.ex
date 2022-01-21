defmodule WordleWeb.Live.Components.Word do
  use Phoenix.Component

  def show(assigns) do
    ~H"""
    <%= String.split(@word, "", trim: true) |> Enum.with_index |> Enum.map(fn({char, index}) -> %>
        <div class={class(char, index, @secret_word)}> <%= char %> </div>
    <% end) %>
    """
  end

  def placeholder(assigns) do
    ~H"""
    <%= for _i <- 1..5 do %>
      <div class="text-center text-2xl border-2 h-16 text-white border-white rounded bg-black md:w-20 md:h-20"></div>
    <% end %>
    """
  end

  defp class(char, index, secret_word) do
    common_classes =
      "flex justify-center items-center text-2xl md:text-4xl border-2 h-16 text-white border-white rounded md:w-20 md:h-20 "

    color =
      cond do
        String.split(secret_word, "", trim: true) |> Enum.at(index) == char ->
          "bg-green-500"

        Enum.member?(String.split(secret_word, "", trim: true), char) ->
          "bg-yellow-500"

        true ->
          "bg-black"
      end

    common_classes <> color
  end
end
