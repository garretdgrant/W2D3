class HumanPlayer
    attr_reader :mark
   def initialize(value_mark)
    @mark = value_mark
   end

   def get_position
            puts "Player " + @mark.to_s + ", 2 numbers with a space in between for the position of your mark"
            puts "Example: '0 2'"
            position = gets.chomp
            if position.count(" ") != 1
                raise ArgumentError "Not a Valid Entry"
            end
            nums = "0123456789"
            if !nums.include?(position[0]) || !nums.include?(position[-1])
                raise ArgumentError "Not a valid Entry"
            end
            
            position.split.map{|snum| snum.to_i}
   end

end

