require './Player.rb'
require './Question.rb'

class MathGame
  def initialize
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @current_player_index = 0
  end

  def current_player
    @players[@current_player_index]
  end

  def switch_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def play_turn
    # question = generate_question
    # puts "#{current_player.name}, #{question[:question]}"
    puts "------ #{current_player.name}'s turn -------"
    question = Question.new
    player_answer = gets.chomp.to_i

    # if player_answer == question[:answer]
    if question.validate(player_answer)
      puts "Correct! #{current_player.name} gains a life."
      current_player.gain_life
    else
      puts "Incorrect! #{current_player.name} loses a life."
      current_player.lose_life
    end

    puts "Scores: #{player_scores}"
    # puts "------ #{current_player.name}'s turn -------"
    switch_player
  end

  def player_scores
    @players.map { |player| "#{player.name}: #{player.lives} lives" }.join(', ')
  end

  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }
    loser = @players.find { |player| player.lives <= 0 }
    puts "#{winner.name} wins! Final scores - #{winner.name}: #{winner.lives} lives, #{loser.name}: #{loser.lives} lives."
  end

  def start
    until game_over?
      play_turn
    end

    announce_winner
  end
end

# Example: Start the game
MathGame.new.start