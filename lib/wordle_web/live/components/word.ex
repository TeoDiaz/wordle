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
      <div class="text-center pt-4 text-4xl border-2 w-20 h-20 text-white border-white rounded mr-1 mb-1 bg-black"></div>
    <% end %>
    """
  end
  
  defp class(char, index, secret_word) do
    common_classes = "text-center pt-4 text-4xl border-2 w-20 h-20 text-white border-white rounded mr-1 mb-1 " 
    color = cond do 
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