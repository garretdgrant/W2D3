class Board
    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n){["_"] * n}
    end

    def valid?(position)
        r = position[0]
        c = position[1]
        return false if r > @grid.length - 1 || c > @grid.length - 1
        true
    end

    def empty?(position)
        r = position[0]
        c = position[1]
        return true if @grid[r][c] == "_"
        false
    end

    def place_mark(position, mark)
        r = position[0]
        c = position[1]
       if !self.valid?(position) || !self.empty?(position)
        raise ArgumentError "Not a Valid Move"
       end
       @grid[r][c] = mark
    end
    
    def print
        puts "Garret's Dynamic Tic Tac Toe Board: "
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all?(mark)
        end
        false
    end

    def win_col?(mark)
        won = true
        @grid.each.with_index do |row|
           won = false if row[0] != mark
        end
        won
    end

    def win_diagonal?(mark)
        diag1 = true
        n = @grid.length - 1
        @grid.each.with_index do |row, i1|
            row.each.with_index do |col, i2|
               diag1 = false if i1 == i2 && @grid[i1][i2] != mark
            end
        end

        diag2 = true
        for i in 0..n do
            diag2 = false if @grid[i][n-i] != mark
        end
        diag1 || diag2
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end
end

