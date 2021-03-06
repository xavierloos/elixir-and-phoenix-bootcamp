defmodule Identicon do
  def main(input) do
    input
    |>hash_input
    |>pick_color
    |>build_grid
    |>filter_odd
    |>build_pixel
    |>draw_image
    |>save(input)
  end
  # convert the string that's  going to be passed into a series of unique numbers
  # iex(1)> hash = :crypto.hash(:md5, "banana")
  # <<114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65>>
  # iex(2)> Base.encode16(hash) 
  # "72B302BF297A228A75730123EFEF7C41"
  # iex(3)> :binary.bin_to_list(hash)
  # [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    # iex(1)> Identicon.main("Javier")
    # [171, 2, 252, 235, 150, 137, 17, 75, 28, 209, 132, 78, 69, 108, 6, 149]
    %Identicon.Image{hex: hex}
  end

  # Generate the colors: to do this, just take the first three numbers on the list return in the hash which is a RGB form value
  # Each square in the Identicon grid has a number, if the number is ODD we will NOT color that square.
  def  pick_color(%Identicon.Image{hex:  [r, g, b | _tail]} = image) do
    # Use pathern matching
    
    # Use | _tail so you define that you don't care about the other values of the array
    # [r, g ,b]
    # iex(6)> Identicon.main("javi")
    # [161, 79, 138]

    %Identicon.Image{image | color: {r, g, b}}
    # iex(12)> Identicon.main("javi")
    # %Identicon.Image{
    #   color: {161, 79, 138},
    #   hex: [161, 79, 138, 84, 14, 120, 218, 231,
    #    6, 210, 85, 117, 0, 16, 160, 248]
    # }
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid = hex
    |>Enum.chunk(3) 
    |>Enum.map(&mirrow_row/1)
    # iex(36)> Identicon.main("Javi")
    # [
    #   [20, 195, 204, 195, 20],
    #   [136, 203, 32, 203, 136],
    #   [10, 239, 2, 239, 10],
    #   [240, 20, 139, 20, 240]
    # ]
    |> List.flatten
    |>Enum.with_index
    %Identicon.Image{image | grid: grid}
  end

  def mirrow_row(row) do
    # [161, 79, 138]
    [first, second | _tail] = row
    # [161, 79, 138, 79,162]
    row ++ [second,first]
    #  Identicon.mirrow_row([20, 195, 204]) 
    # [20, 195, 204, 195, 20]
  end
   
  def filter_odd(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end

    %Identicon.Image{image | grid:  grid}
  end

  # ENLANG EDG
  # We need to create a blank image
  # Once it's created we can fill the image 
  # We need to generate the starting and ending point 
  def  build_pixel(%Identicon.Image{grid: grid} = image) do
    pixel = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50
      top_left = {horizontal, vertical}
      bottom_rigth = {horizontal + 50, vertical + 50}
      {top_left, bottom_rigth}
    end
    %Identicon.Image{image | pixel: pixel}
  end

  def draw_image(%Identicon.Image{color: color, pixel: pixel}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)
    Enum.each pixel, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end
    :egd.render(image)
  end

  def save(image, input) do
    File.write("#{input}.png", image)
  end
end
