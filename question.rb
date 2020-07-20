class Question
  attr_reader(:answer)

  def initialize
      @first = rand(1..20)
      @second = rand(1..20)
      @answer = @first + @second
    end
  

  def to_string
    "What do you get when you add #{@first} and #{@second}?   "
  end

  def right_answer?(user_input)
    if user_input == @answer
      return true
    else
      return false
    end
  end


end
