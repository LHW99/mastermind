module Formulae
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
  end
  
  def cpuChoice
    i = 0
    @@cChoices = []
    while i < 5
      @@cChoices.push(rng)
      i+=1
    end
    puts @@cChoices
  end

  def verifyContains(try, cChoices)
    counts = Hash.new(0)
    cChoices.each { |t| counts[t] += 1}
  end

  def verify(playerChoice, cChoice)
    j = 0
    exact = 0
    contains = 0
    while j < 5
      if playerChoice[j] == cChoice[j]
        exact += 1
        j+=1
      elsif cChoice.count playerChoice[j] > 0
        contains = cChoice.count playerChoice[j]
        j+=1
      else j+=1
      end
    end
    puts "Exactly correct: #{exact}"
    puts "Correct, but in wrong location: #{contains}"
  end

end

class MasterMind
  include Formulae

  def initialize
    intro
    reset
    playerguess
  end

  def reset
    cpuChoice
    @@round = 1
    @@attempt = []
  end

  def intro
    puts "Welcome to mastermind!\nPlease input a guess."
  end

  def playerguess
    puts "select 5 colors.1=r,2=y,3=g,4=b,5=p"
    while @@attempt.length < 5
    case gets.strip
      when "1"
        @@attempt.push("RED")
      when "2" 
        @@attempt.push("YELLOW")
      when "3"
        @@attempt.push("GREEN")
      when "4"
        @@attempt.push("BLUE")
      when "5"
        @@attempt.push("PURPLE")
      else
        puts "Please input a number"
      end
    end
    puts "Your Guess: #{@@attempt}"
    puts verify(@@attempt, @@cChoices)
    if @@attempt == @@cChoices 
      winCondition
    else
      @@round += 1
      @@attempt = 0
      playerguess
    end
  end

  def winCondition
    if @@attempt == @@cChoices
      puts "YOU WIN!"

    elsif @@round == 12
      puts "YOU LOSE!"

    end
  end
end

MasterMind.new