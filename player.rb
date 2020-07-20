class Player
  attr_accessor(:name, :lives, :right_answers)


  def initialize(name, lives=3)
    @name = name
    @lives = lives
    @right_answers = 0
  end

  def right_answer
    @right_answers += 1
  end

  def lose_life
    @lives -= 1
  end
end
