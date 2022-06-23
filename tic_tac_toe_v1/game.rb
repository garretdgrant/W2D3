require_relative "board"
require_relative "human_player"

class Game
    def initialize(board_size,p1_mark, p2_mark)
        @player_1 = HumanPlayer.new(p1_mark)
        @player_2 = HumanPlayer.new(p2_mark)
        @current_player = @player_1
        @board = Board.new(board_size)
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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