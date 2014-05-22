class Mars
  attr_reader :grid
  def initialize(grid_size)
    grid_size = grid_size.split(" ")
    width = grid_size[0].to_i
    height = grid_size[1].to_i
    @grid = create_grid(width, height)
  end

  def create_grid(width, height)
    (0..height).map{|row_number|
      (0..width).map{|column_number|
        [column_number, row_number]
      }
    }
  end
end

