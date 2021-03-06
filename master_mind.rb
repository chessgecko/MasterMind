class Master_mind

  attr_accessor :solution_Array
  attr_accessor :guess_Array
  attr_accessor :old_Guesses
  attr_accessor :old_Outputs

  def self.returnSolutionArray
    @solution_Array = [] if(@solution_Array == nil)
    @solution_Array
  end

  def self.setSolutionArray(array)
    @solution_Array = array
  end

  def self.returnGuessArray
     @guess_Array = [] if @guess_Array == nil
     @guess_Array
  end

  def self.setGuessArray(array)
    if(@solution_Array.size == array.size)
    @guess_Array = array
    return true
    end
    return false
  end

  def self.getOutputArray

    sudoSolution = @solution_Array.clone
    sudoGuess = @guess_Array.clone
    output = []
    getOutputArray2s(sudoGuess,sudoSolution, output)
    getOutputArray1s(sudoGuess,sudoSolution,output)
    return output

  end

  def self.getOutputArray2s (sudoGuess, sudoSolution, output)
    counter = 0
    while (counter<sudoGuess.length) #shouldnt use each do loop if you are going to delete elements from the array
      if sudoGuess[counter] == sudoSolution[counter]
        output << 2
        sudoGuess.delete_at(counter)
        sudoSolution.delete_at(counter)
        counter-=1
      end
      counter+=1
    end
  end

  def self.getOutputArray1s (sudoGuess, sudoSolution, output)

    sudoGuess = sudoGuess.sort
    sudoSolution = sudoSolution.sort
    guessCounter = 0
    solutCounter = 0

    while theCountersHaveNotExceededTheLengthOfTheirRespectiveArrays?(guessCounter, sudoGuess, solutCounter,sudoSolution)
      if aMatchIsFound?(guessCounter, sudoGuess, solutCounter,sudoSolution)
        sudoGuess.delete_at guessCounter
        sudoSolution.delete_at solutCounter
        output << 1
      elsif theCurrentCounterPositionOfTheGuessContainsAHigherValueThanTheSolutionsCurrentPosition(guessCounter, sudoGuess, solutCounter,sudoSolution)
        solutCounter+=1
      else
        guessCounter+=1
      end
    end
  end

  def self.theCountersHaveNotExceededTheLengthOfTheirRespectiveArrays?(guessLoc, sudoGuess, solutLoc,sudoSolution)
    return (guessLoc < sudoGuess.length && solutLoc < sudoSolution.length)
  end

  def self.aMatchIsFound?(guessLoc, sudoGuess, solutLoc,sudoSolution)
      return sudoGuess[guessLoc] == sudoSolution[solutLoc]
  end
  def self.theCurrentCounterPositionOfTheGuessContainsAHigherValueThanTheSolutionsCurrentPosition(guessCounter, sudoGuess, solutCounter,sudoSolution)
    sudoGuess[guessCounter] > sudoSolution[solutCounter]
  end

  def self.returnOldOutputs
    @old_Outputs
  end

  def self.returnOldGuesses
     @old_Guesses
  end

  def self.addToOldOutputs(newOutput)
     @old_Outputs = [] if(@old_Outputs == nil)
     @old_Outputs << newOutput
  end

  def self.addToOldGuesses(newGuess)
    @old_Guesses = [] if(@old_Guesses == nil)
    @old_Guesses << newGuess
  end

  def self.clearOldOutputs
    @old_Outputs = []
  end

  def self.clearOldGuesses
    @old_Guesses = []
  end

  def self.setSizeOfSolutionAndGenerateIt (solutionSize)

     if SolutionSizeIsInvalid?(solutionSize)
        return false
     end

    solutionArray = []
    solutionCounter = 0
    while solutionCounter <solutionSize

      solutionArray[solutionCounter] = rand(8)+1
      solutionCounter+=1
    end
     self.setSolutionArray solutionArray
     return true
  end

  def self.SolutionSizeIsInvalid? (solutionSize)
    return solutionSize > 9 || solutionSize<3
  end

  #methods below currently have no tests

  def self.hasWon? ()
    if(@old_Outputs[@old_Outputs.size-1].size == @solution_Array.size &&@old_Outputs[@old_Outputs.size-1][@old_Outputs[@old_Outputs.size-1].size-1].to_s == "2")
      return true
    end
    return false
  end

  def self.setupGame
    self.clearOldOutputs
    self.clearOldGuesses
  end

  def self.makeAMove (unparsedInput)
    inputArray = unparsedInput.scan(/\d+/)
    tempGuessArray = []
    inputArray.each do |x| tempGuessArray << x.to_s.to_i end
    setGuessArray(tempGuessArray)
    addToOldGuesses(tempGuessArray)
    addToOldOutputs(getOutputArray)
  end

end


