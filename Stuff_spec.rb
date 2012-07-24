require "rspec"
require './master_mind'

describe MasterMinder do

  it "should return the solution array" do
      MasterMinder.returnSolutionArray.should == []
  end

  it "should set the solution array" do
    MasterMinder.setSolutionArray([4,3,2,1])
    MasterMinder.returnSolutionArray.should == [4,3,2,1]
  end

  it "should return the guess array" do
    MasterMinder.returnGuessArray.should == []
  end

  it "should set the guess array" do
    MasterMinder.setGuessArray([4,2,2,1])
    MasterMinder.returnGuessArray.should == [4,2,2,1]
  end

  [
      [[1,3,2,4],[3,2,2,5], [2,1] ],
      [[4,5,6,7], [1,2,3,8], []],
      [[2,2,2,2], [2,2,2,2], [2,2,2,2]],
      [[3,3,2,2], [3,2,2,3], [2,2,1,1]],
      [[1,2,3,4], [4,3,2,1], [1,1,1,1]]


  ].each do  | guess, solution, out|
      it "should return the output " do
        MasterMinder.setGuessArray(guess)
        MasterMinder.setSolutionArray(solution)
        MasterMinder.getOutputArray.should == out
      end
  end

  it "should set and return the array of old guesses" do
      MasterMinder.addToOldGuesses([4,4,4,4])
      MasterMinder.returnOldGuesses.should == [[4,4,4,4]]
      MasterMinder.addToOldGuesses([3,2,3,2])
      MasterMinder.returnOldGuesses.should == [[4,4,4,4],[3,2,3,2]]
      MasterMinder.clearOldGuesses
      MasterMinder.returnOldGuesses.should == []
  end

  it "should set and return the array of old outputs" do
    MasterMinder.addToOldOutputs([4,4,4,4])
    MasterMinder.returnOldOutputs.should == [[4,4,4,4]]
    MasterMinder.addToOldOutputs([3,2,3,2])
    MasterMinder.returnOldOutputs.should == [[4,4,4,4],[3,2,3,2]]
    MasterMinder.clearOldOutputs
    MasterMinder.returnOldOutputs.should == []
  end

  it "should only accept a guess of the correct length" do
    MasterMinder.setSolutionArray([3,5,6,7])
    MasterMinder.setGuessArray([3,4,5]).should == false
  end

  it "should set a solution array of size n if n > 2 and n< 10" do
    MasterMinder.setSizeOfSolutionAndGenerateIt(3)
    MasterMinder.returnSolutionArray.size.should == 3
    MasterMinder.setSizeOfSolutionAndGenerateIt(2).should == false
  end

end
