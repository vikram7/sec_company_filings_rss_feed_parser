defmodule ParseUtility do
  @moduledoc "a module to hold common helper functions"

  defmacro __using__(_opts) do
    quote do

      def extract_last_item([]), do: nil

      def extract_last_item([tuple | _]) do
        {_, _, [last_item | _]} = tuple
        last_item
      end
    end
  end
end
