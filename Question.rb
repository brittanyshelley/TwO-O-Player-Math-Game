

class Question

  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    @answer = num1 + num2
    puts "What is #{num1} + #{num2}?"
  end

  def validate answer
    answer.to_i == @answer
  end
end

# q1 = Question.new # initializes a new question
# answer = gets.chomp # once you give and answer, it will validate
# p q1.validate(answer) # calling the method with the answer
# answer = gets.chomp # once you give and answer, it will validate
# p q1.validate(answer) # calling the method with the answer