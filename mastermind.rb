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

  def checkRed(playerChoice, cChoice)
    j = 0
    redexact = 0
    redcontain = 0
    while j < 5
      if cChoice[j] == "RED" 
        redexact += 1
        j += 1
      else 
        j += 1
      end
    end
    if cChoice.count("RED") > 0
      redcontain = cChoice.count("RED") - redexact
    end
    @exact += redexact
    @contains += redcontain
  end

  def checkYellow(playerChoice, cChoice)
    j = 0
    yellowexact = 0
    yellowcontain = 0
    while j < 5
      if cChoice[j] == "YELLOW" 
        yellowexact += 1
        j += 1
      else 
        j += 1
      end
    end
    if cChoice.count("YELLOW") > 0
      yellowcontain = cChoice.count("YELLOW") - yellowexact
    end
    @exact += yellowexact
    @contains += yellowcontain
  end

  def checkGreen(playerChoice, cChoice)
    j = 0
    greenexact = 0
    greencontain = 0
    while j < 5
      if cChoice[j] == "GREEN" 
        greenexact += 1
        j += 1
      else 
        j += 1
      end
    end
    if cChoice.count("GREEN") > 0
      greencontain = cChoice.count("GREEN") - greenexact
    end
    @exact += greenexact
    @contains += greencontain
  end

  def checkBlue(playerChoice, cChoice)
    j = 0
    blueexact = 0
    while j < 5
      if cChoice[j] == "BLUE" 
        blueexact += 1
        j += 1
      else 
        j += 1
      end
    end
    if cChoice.count("BLUE") > 0
      bluecontain = cChoice.count("BLUE") - blueexact
    end
    @exact += blueexact
    @contains += bluecontain
  end

  def checkPurple(playerChoice, cChoice)
    j = 0
    purpleexact = 0
    while j < 5
      if cChoice[j] == "PURPLE" 
        purpleexact += 1
        j += 1
      else 
        j += 1
      end
    end
    if cChoice.count("PURPLE") > 0
      purplecontain = cChoice.count("PURPLE") - purpleexact
    end
    @exact += purpleexact
    @contains += purplecontain
  end

  def verify(playerChoice, cChoice)
    @exact = 0
    @contains = 0
    checkRed(playerChoice, cChoice)
    checkYellow(playerChoice, cChoice)
    checkGreen(playerChoice, cChoice)
    checkBlue(playerChoice, cChoice)
    checkPurple(playerChoice, cChoice)
    puts "Exactly correct: #{@exact}"
    puts "Correct, but in wrong location: #{@contains}"
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
      @@attempt = []
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