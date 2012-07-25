require './master_mind'


class InputHandler

  attr_accessor :aCorrectInputSizeWasSet

  def self.setupInputHandler
    @aCorrectInputSizeWasSet = false
  end

  def self.aCorrectInputSizeWasSet?
    @aCorrectInputSizeWasSet
  end

  def self.setACorrectInputSizeWasSet (value)
    @aCorrectInputSizeWasSet = value
  end

  def self.inputHandlerSizeOfSolution(nonParsedSize, game)
    return 0 if(nonParsedSize.to_s.downcase == "escape")
    input = nonParsedSize.scan(/\d+/)
    return 1 if(input.size == 0 || input.size > 1)
    return 2 if input[0].to_s.to_i > 9 || input[0].to_s.to_i<3
    game.setSizeOfSolutionAndGenerateIt(input[0].to_s.to_i)
    return 3
  end

  def self.inputHandlerGuessInput(unparsedInput, game)
    return 0 if(unparsedInput.to_s.downcase == "escape")
    inputArray = unparsedInput.scan(/\d+/)
    return 1 if(inputArray.size != game.returnSolutionArray.size)
    inputArray.each do |x|
      return 2 if(x.to_s.to_i > 8 || x.to_s.to_i<1)
    end
    return 3
  end

  def self.shouldEscape? (number)
    return number == 0
  end

  def self.shouldSayTooManyNumbersInput? (number)
    return number == 1
  end
  def self.shouldSayNumberOutOfRange? (number)
    return number == 2
  end
  def self.shouldMakeAMove? (number)
    return number == 3
  end


end