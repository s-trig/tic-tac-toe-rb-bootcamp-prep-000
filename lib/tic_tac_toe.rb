
WIN_COMBINATIONS = [
  [0,1,2], [0,3,6], [0,4,8],
  [3,4,5], [1,4,7], [2,4,6],
  [6,7,8], [2,5,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(array, index, char)
  array[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
   !position_taken?(board, index) && index.between?(0,8) ? true : false
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |i|
    if i == "X" || i == "O"
      count += 1
    end
  end
   count
end

def current_player(board)
  if turn_count(board) % 2 == 0
  "X"
  else
  "O"
  end
end

def won?(board)
   WIN_COMBINATIONS.detect do |i|
  board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && position_taken?(board, i[0])
  end
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
    !won?(board) && full?(board) ? true : false
end

def over?(board)
   won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  if wins = won?(board)
    board[wins.first]
  end
end

def play(board)
  pc = 0;
 while pc < 9
  turn(board)
  pc += 1
  end
end
