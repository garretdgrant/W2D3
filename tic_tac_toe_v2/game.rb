require_relative "board"
require_relative "human_player"

class Game
    def initialize(board_size,*p_marks)
        @players = p_marks.map{|mark| HumanPlayer.new(mark)}
        @current_player = @players[0]
        @board = Board.new(board_size)
    end

    def switch_turn
       idx = @players.index(@current_player)
       @current_player = @players[(idx + 1) % @players.length]
    end

    def play
        while @board.grid.flatten.include?("_")
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory"
                return
            else
                self.switch_turn
            end


        end
        puts "draw"
    end
end