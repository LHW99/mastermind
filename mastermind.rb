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
    cChoices = []
    i = 0
    while i < 5
      cChoices.push(rng)
      i+=1
    end
  end

  def verify(playerChoice, cpuChoice)
    j = 0
    while j < 4
      if playerChoice[j] == cpuChoice[j]
        then 


end

class selection
  include rng

  def initialize
  end

  def reset
    @@cChoices = cpuChoice
    @@t1 = []; @@t2 = []; @@t3 = []; @@t4 = [];
    @@t5 = []; @@t6 = []; @@t7 = []; @@t8 = [];
    @@t9 = []; @@t10 = []; @@t11 = []; @@t12 = [];
  end

end