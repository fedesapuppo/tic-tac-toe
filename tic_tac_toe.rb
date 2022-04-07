# frozen_string_literal: true

class Board
  $valid_moves = %w[1 2 3 4 5 6 7 8 9]
  attr_accessor :position1, :position2, :position3, :position4, :position5, :position6, :position7, :position8,
                :position9

  def initialize(p1, p2, p3, p4, p5, p6, p7, p8, p9)
    @position1 = p1
    @position2 = p2
    @position3 = p3
    @position4 = p4
    @position5 = p5
    @position6 = p6
    @position7 = p7
    @position8 = p8
    @position9 = p9
  end

  def draw_board
    puts "
    #{@position1} | #{@position2} | #{@position3}
    --+---+--
    #{@position4} | #{@position5} | #{@position6}
    --+---+--
    #{@position7} | #{@position8} | #{@position9}

    "
  end
end

class Player
  attr_accessor :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end
end

def initialize_game
  $board = Board.new(1, 2, 3, 4, 5, 6, 7, 8, 9)
  puts 'Please enter player 1 name:'
  player1_name = gets.chomp
  $player1 = Player.new(player1_name, 'X')
  puts "#{player1_name}, you will play with crosses!", ' '
  puts 'Please enter player 2 name:'
  player2_name = gets.chomp
  $player2 = Player.new(player2_name, 'O')
  puts "#{player2_name}, you will play with noughts!", ' '
  $board.draw_board
end

def make_p1_play
  puts "#{$player1.name}: choose an available space to place a cross, and enter the corresponding number"
  $move = gets.chomp
  until $valid_moves.include? $move
    puts 'Invalid choice. Please, choose an available space to place a cross, and enter the corresponding number'
    $move = gets.chomp
  end
  case $move
  when '1'
    $board.position1 = 'X'
    $valid_moves.delete('1')
  when '2'
    $board.position2 = 'X'
    $valid_moves.delete('2')
  when '3'
    $board.position3 = 'X'
    $valid_moves.delete('3')
  when '4'
    $board.position4 = 'X'
    $valid_moves.delete('4')
  when '5'
    $board.position5 = 'X'
    $valid_moves.delete('5')
  when '6'
    $board.position6 = 'X'
    $valid_moves.delete('6')
  when '7'
    $board.position7 = 'X'
    $valid_moves.delete('7')
  when '8'
    $board.position8 = 'X'
    $valid_moves.delete('8')
  when '9'
    $board.position9 = 'X'
    $valid_moves.delete('9')
  end
end

def make_p2_play
  puts "#{$player2.name}: choose an available space to place a cross, and enter the corresponding number"
  $move = gets.chomp
  until $valid_moves.include? $move
    puts 'Invalid choice. Please, choose an available space to place a cross, and enter the corresponding number'
    $move = gets.chomp
  end
  case $move
  when '1'
    $board.position1 = 'O'
    $valid_moves.delete('1')
  when '2'
    $board.position2 = 'O'
    $valid_moves.delete('2')
  when '3'
    $board.position3 = 'O'
    $valid_moves.delete('3')
  when '4'
    $board.position4 = 'O'
    $valid_moves.delete('4')
  when '5'
    $board.position5 = 'O'
    $valid_moves.delete('5')
  when '6'
    $board.position6 = 'O'
    $valid_moves.delete('6')
  when '7'
    $board.position7 = 'O'
    $valid_moves.delete('7')
  when '8'
    $board.position8 = 'O'
    $valid_moves.delete('8')
  when '9'
    $board.position9 = 'O'
    $valid_moves.delete('9')
  end
end

def check_winner
  if $board.position1 == 'X' && $board.position2 == 'X' && $board.position3 == 'X' ||
     $board.position4 == 'X' && $board.position5 == 'X' && $board.position6 == 'X' ||
     $board.position7 == 'X' && $board.position8 == 'X' && $board.position9 == 'X' ||
     $board.position1 == 'X' && $board.position4 == 'X' && $board.position7 == 'X' ||
     $board.position2 == 'X' && $board.position5 == 'X' && $board.position8 == 'X' ||
     $board.position3 == 'X' && $board.position6 == 'X' && $board.position9 == 'X' ||
     $board.position1 == 'X' && $board.position5 == 'X' && $board.position9 == 'X' ||
     $board.position3 == 'X' && $board.position5 == 'X' && $board.position7 == 'X'
    $winner = $player1.name
    puts "Game over, #{$winner} is the winner!!"
  end

  if $board.position1 == 'O' && $board.position2 == 'O' && $board.position3 == 'O' ||
     $board.position4 == 'O' && $board.position5 == 'O' && $board.position6 == 'O' ||
     $board.position7 == 'O' && $board.position8 == 'O' && $board.position9 == 'O' ||
     $board.position1 == 'O' && $board.position4 == 'O' && $board.position7 == 'O' ||
     $board.position2 == 'O' && $board.position5 == 'O' && $board.position8 == 'O' ||
     $board.position3 == 'O' && $board.position6 == 'O' && $board.position9 == 'O' ||
     $board.position1 == 'O' && $board.position5 == 'O' && $board.position9 == 'O' ||
     $board.position3 == 'O' && $board.position5 == 'O' && $board.position7 == 'O'
    $winner = $player2.name
    puts "Game over, #{$winner} is the winner!!"
  end
end

def check_tie
  if $valid_moves.empty? && !winner
    puts "Game over! It's a tie!!"
    $tie = true
  end
end

def play_game
  $winner = nil
  $tie = false
  while !$winner && !$tie
    make_p1_play
    $board.draw_board
    check_winner
    check_tie
    next unless !$winner && !$tie

    make_p2_play
    $board.draw_board
    check_winner
    check_tie
  end
end

initialize_game
play_game
