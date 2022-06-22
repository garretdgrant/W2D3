

class Board
    attr_reader :size
  def initialize(n)
    @grid = Array.new(n){[:N]*n}
    @size = n*n
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.flatten.count{|ele| ele == :S}
  end

  def attack(position)
    check = self[position]
    if check == :S
        self[position] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[position] = :X
        return false
    end
  end

  def place_random_ships
    quarter = @size/4
    while @grid.flatten.count{|ele| ele == :S} < quarter
        pos1 = rand(@grid.length)
        pos2 = rand(@grid.length)
        pos = [pos1, pos2]
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    hidden_grid = Array.new(@grid.length){Array.new(@grid.length)}
    @grid.each.with_index do |sub, i1|
        sub.each.with_index do |num, i2|
            hidden_grid[i1][i2] = num
        end
    end


    hidden_grid.each do |sub|
        sub.map! do |sym| 
            if sym == :S
                sym = :N
            else
                sym = sym
            end
        end
    end
    hidden_grid
 end

 def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
 end

 def cheat
    Board.print_grid(@grid)
 end

 def print
    Board.print_grid(self.hidden_ships_grid)
 end
end
