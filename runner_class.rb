require './master_mind'
require './input_handler'
require './output_handler'

class RunnerClass
GAME = Master_mind
puts(OutputHandler.helloMessage)

while true

  GAME.setupGame
  InputHandler.setupInputHandler

  puts(OutputHandler.slotSizeMessage)
  puts(OutputHandler.escapeMessage)

  while !(InputHandler.aCorrectInputSizeWasSet?)
    nonParsedSize = gets.chomp

    inputsMessage = InputHandler.inputHandlerSizeOfSolution(nonParsedSize, GAME)
    if(InputHandler.shouldEscape?(inputsMessage))
      exit
    end

    if(InputHandler.shouldSayTooManyNumbersInput?(inputsMessage))
      puts(OutputHandler.toManyNumbersInputAtSizeSetup)
      next
    end

    if(InputHandler.shouldSayNumberOutOfRange?(inputsMessage))
      puts(OutputHandler.numbersAtSetupOutOfRange)
      next
    else
      InputHandler.setACorrectInputSizeWasSet(true)
    end
  end

  while GAME.returnOldGuesses.size < 10 && GAME.hasWon? == false
    temporaryOldGuesses = GAME.returnOldGuesses
    temporaryOldOutputs = GAME.returnOldOutputs

    displayOldResults(temporaryOldOutputs, temporaryOldGuesses)

    puts OutputHandler.normalInputMessage(GAME.returnSolutionArray.size)
    puts OutputHandler.escapeMessage

    inputAValidGuess = false

    inputsMessage = 0

    while !InputHandler.shouldMakeAMove?(inputsMessage)

      unparsedInput = gets.chomp
      inputsMessage = InputHandler.inputHandlerGuessInput(unparsedInput,GAME)

      if(InputHandler.shouldEscape?(inputsMessage))
        exit
      end

      if(InputHandler.shouldSayTooManyNumbersInput?(inputsMessage))
        puts(OutputHandler.invalidNumberOfSquaresMessage)
        next
      end

      if(InputHandler.shouldSayNumberOutOfRange?(inputsMessage))
        puts(OutputHandler.invalidValueOfSomeSquareMessage)
        inputAValidGuess = false
      end

      if(InputHandler.shouldMakeAMove?(inputsMessage))
        GAME.makeAMove(unparsedInput)
        if(GAME.hasWon?())
          break
          puts (OutputHandler.winMessage)
        end
      end

    end
  end
  if(!GAME.hasWon?)
    puts(OutputHandler.loseMessage)
  end
end

def self.displayOldResults(temporaryOldOutputs, temporaryOldGuesses)
  i = 0
  while i<temporaryOldOutputs.size
    puts OutputHandler.displayASingleOldGuessAndOutput(i, temporaryOldGuesses[i].to_s, temporaryOldOutputs[i].to_s)
    i+=1
  end

end
end


