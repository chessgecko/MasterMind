module MasterMinder
  attr_accessor :Solution_Array
  attr_accessor :Guess_Array
  attr_accessor :Old_Guesses
  attr_accessor :Old_Outputs

  def self.returnSolutionArray
    @Solution_Array = [] if(@Solution_Array == nil)
    @Solution_Array
  end

  def self.setSolutionArray(array)
    @Solution_Array = array
  end

  def self.returnGuessArray
     @Guess_Array = [] if @Guess_Array == nil
     @Guess_Array
  end

  def self.setGuessArray(array)
    if(@Solution_Array.size == array.size)
    @Guess_Array = array
    return true
    end
    return false
  end

  def self.getOutputArray

    sudoSolution = @Solution_Array.clone
    sudoGuess = @Guess_Array.clone
    output = []

    x = 0

    while (x<sudoGuess.length) #shouldnt use each do loop if you are going to delete elements from the array
         if sudoGuess[x] == sudoSolution[x]
           output << 2
           sudoGuess.delete_at(x)
           sudoSolution.delete_at(x)
           x-=1
         end
      x+=1
    end

    sudoGuess = sudoGuess.sort
    sudoSolution = sudoSolution.sort

   # printf(sudoSolution.to_s + ' sudo solution ' + sudoGuess.to_s + ' sudo guess')

    guessLoc = 0
    solutLoc = 0

    while guessLoc < sudoGuess.length && solutLoc < sudoSolution.length

      if sudoGuess[guessLoc] == sudoSolution[solutLoc]
        sudoGuess.delete_at(guessLoc)
        sudoSolution.delete_at(solutLoc)
        output << 1
      elsif sudoGuess[guessLoc] > sudoSolution[solutLoc]
        solutLoc+=1
      else
        guessLoc+=1
      end
    end
    return output
  end

  def self.returnOldOutputs
    @Old_Outputs
  end

  def self.returnOldGuesses
     @Old_Guesses
  end

  def self.addToOldOutputs(newOutput)
     @Old_Outputs = [] if(@Old_Outputs == nil)
     @Old_Outputs << newOutput
  end

  def self.addToOldGuesses(newGuess)
    @Old_Guesses = [] if(@Old_Guesses == nil)
    @Old_Guesses << newGuess
  end

  def self.clearOldOutputs
    @Old_Outputs = []
  end

  def self.clearOldGuesses
    @Old_Guesses = []
  end

  def self.setSizeOfSolutionAndGenerateIt (n)

     if(n > 9 || n<3)
        return false
     end

    a = []
     b = 0
    while b <n

      a[b] = rand(8)+1
      b+=1
    end
     self.setSolutionArray(a)
     return true
  end



end


puts("Hello and welcome to Mastermind")

while true

  puts("Input the number of squares that you would like to play on, must be between 3 and 9 inclusive")
  puts("or input escape to end the program")
  MasterMinder.clearOldOutputs
  MasterMinder.clearOldGuesses

  aCorrectInputSizeWasSet = false
  while !aCorrectInputSizeWasSet
  nonParsedSize = gets.chomp

  if(nonParsedSize.to_s.downcase == "escape")
    exit
  end

  input = nonParsedSize.scan(/\d+/)
  if(input.size == 0 || input.size > 1)
    puts("Please input a single number between 3 and 9 inclusive")
    next
  end

  if(MasterMinder.setSizeOfSolutionAndGenerateIt(input[0].to_s.to_i))
    aCorrectInputSizeWasSet = true
  else
    puts("please input a number between 3 and 9 inclusive")
  end

  end

  won = false
  while MasterMinder.returnOldGuesses.size < 10 && !won

    m = MasterMinder.returnOldGuesses
    p = MasterMinder.returnOldOutputs
    i = 0

    while i<p.size
         puts("previous guess # #{i} = #{m[i].to_s} previous output # #{i} = #{p[i].to_s}")
      i+=1
    end

    puts("please input #{MasterMinder.returnSolutionArray.size} numbers between 1 and 8 inclusive with spaces between them")
    puts("or input escape to end the program")

    inputAValidGuess = false
    while !inputAValidGuess

      unparsedInput = gets.chomp

      if(unparsedInput.to_s.downcase == "escape")
        exit
      end

      inputArray = unparsedInput.scan(/\d+/)

      if(inputArray.size != MasterMinder.returnSolutionArray.size)
        puts("invalid number of squares input")
        next
      end
      inputAValidGuess = true
      inputArray.each do |someValue|
        if(someValue.to_s.to_i <1 || someValue.to_s.to_i >8)
          puts("invalid number greater than 8 or less than 0")
          inputAValidGuess = false
        end
      end

      if(inputAValidGuess)
        tempGuessArray = []
        inputArray.each do |x| tempGuessArray << x.to_s.to_i end
        MasterMinder.setGuessArray(tempGuessArray)
        temp = MasterMinder.getOutputArray
        puts("the output is #{temp.to_s}")
        MasterMinder.addToOldGuesses(tempGuessArray)

        if(temp.size == tempGuessArray.size && temp[temp.size-1].to_s == "2")
          won = true
          puts ("You Win!!!!!")
        end


        MasterMinder.addToOldOutputs(MasterMinder.getOutputArray)
      end
    end
  end
end
