board = []

var = 3.times do |row_index|
   board[row_index] = []
   3.times do |column_index|
      board[column_index] = []
      board[row_index][column_index] = nil
   end
end

p board