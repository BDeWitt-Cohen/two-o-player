require_relative 'player'
require_relative 'question'
@repl_bool = true
#0 for p1 1 for p2
@turn = 0

puts "Welcome to ruby_math_game (OOP edition)"
puts

print "Player one, what shall we call you?"
@username = gets.chomp
p1 = Player.new(@username)

puts
puts

print "And, player two, what shall we call you?"
@username = gets.chomp
p2 = Player.new(@username)


puts
puts "Let's see who has the better simple addition skills..."
puts

while @repl_bool
  
  question = Question.new

  case @turn
  when 0
    print "#{p1.name}: "
  else 
    print "#{p2.name}: "
  end

  print question.to_string
  @user_input = gets.chomp.to_i

  if @turn == 0 && question.right_answer?(@user_input)
    puts
    puts "Nailed it! Number one, number one!"
    p1.right_answer
    @turn += 1
  elsif @turn == 0 && !question.right_answer?(@user_input)
    puts
    puts "Come on dude, that was so easy!"
    p1.lose_life
    @turn += 1
  elsif @turn == 1 && question.right_answer?(@user_input)
    puts
    puts "Amazing! It's like you were born for this!"
    p2.right_answer
    @turn -= 1
  elsif @turn == 1 && !question.right_answer?(@user_input)
    puts
    puts "Come on dude, that was so easy!"
    p2.lose_life
    @turn -= 1
  end

  puts
  puts "Here's the current standings....
        #{p1.name}: #{p1.right_answers} CORRECT ANSWERS #{p1.lives} REMAINING LIVES 
        #{p2.name}: #{p2.right_answers} CORRECT ANSWERS #{p2.lives} REMAINING LIVES"
  puts

  if p1.lives < 1 || p2.lives <1
    puts "Game OVER."
    if p1.lives < 1
      puts "Sucks to be #{p1.name}, #{p2.name} is the winner!"
    elsif p2.lives < 1
      puts "Sucks to be #{p2.name}, #{p1.name} is the winner!"
    end

    puts "Annnnnddddd the final score is....:
        #{p1.name}: #{p1.right_answers} CORRECT ANSWERS #{p1.lives} REMAINING LIVES 
        #{p2.name}: #{p2.right_answers} CORRECT ANSWERS #{p2.lives} REMAINING LIVES"

    @repl_bool = false
  end

end