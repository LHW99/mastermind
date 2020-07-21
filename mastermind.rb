module mastermindFormulas
  def rng
    rColor = rand(1..5)
    if rColor == 1
      "RED"
    elsif rColor == 2
      "YELLOW"
    elsif rColor == 3
      "GREEN"
    elsif rColor == 4
      "BLUE"
    elsif rColor == 5
      "PURPLE"
    end
  
  def cpuChoice
    choices = []
    i = 0
    while i < 5
      choices.push(rng)
      i+=1
    end
  end

  def verifyContains(try, cChoices)
    counts = Hash.new(0)
    cChoices.each { |t| counts[t] += 1}
  end

  def verify(playerChoice, cChoices)
    j = 0
    EXACT = 0
    CONTAINS = 0
    while j < 4
      if playerChoice[j] == cpuChoice[j]
        EXACT += 1
        j+=1
      elsif cpuChoice.include?(playerChoice[j])
        CONTAINS = verifyContains
        j+=1
      end
    end
    puts "Exactly correct: #{EXACT}"
    puts "Correct, but in wrong location: #{CONTAINS}"
  end

end

class selection
  include mastermindFormulas

  def initialize
    intro
  end

  def reset
    @@cChoices = cpuChoice
    @@t1 = []; @@t2 = []; @@t3 = []; @@t4 = [];
    @@t5 = []; @@t6 = []; @@t7 = []; @@t8 = [];
    @@t9 = []; @@t10 = []; @@t11 = []; @@t12 = [];
  end

  def intro
    "Welcome to mastermind!\n Please input a guess."
  end



end