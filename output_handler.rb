class OutputHandler
  def self.helloMessage
    "Hello and welcome to Mastermind"
  end
  def self.slotSizeMessage
    "Input the number of squares that you would like to play on, must be between 3 and 9 inclusive"
  end
  def self.escapeMessage
    "or input escape to end the program"
  end
  def self.toManyNumbersInputAtSizeSetup
    "Please input a single number between 3 and 9 inclusive"
  end
  def self.numbersAtSetupOutOfRange
    "please input a number between 3 and 9 inclusive"
  end
  def self.displayASingleOldGuessAndOutput(guessNumber, guess, output)
    "previous guess # #{guessNumber} = #{guess} previous output # #{guessNumber} = #{output}"
  end
  def self.normalInputMessage(size)
    "please input #{size} numbers between 1 and 8 inclusive with spaces between them"
  end
  def self.invalidNumberOfSquaresMessage
    "invalid number of squares input"
  end
  def self.invalidValueOfSomeSquareMessage
    "invalid number greater than 8 or less than 1"
  end
  def self.outputMessage (output)
    "the output is #{output}"
  end
  def self.winMessage
    "You Win!!!!!"
  end
  def self.loseMessage
    "YOU LOSE!!!!!"
  end


end