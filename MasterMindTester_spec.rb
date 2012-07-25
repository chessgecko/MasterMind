require "rspec"
require './master_mind'

describe Master_mind do

  it "should return the solution array" do
      Master_mind.returnSolutionArray.should == []
  end

  it "should set the solution array" do
    Master_mind.setSolutionArray([4,3,2,1])
    Master_mind.returnSolutionArray.should == [4,3,2,1]
  end

  it "should return the guess array" do
    Master_mind.returnGuessArray.should == []
  end

  it "should set the guess array" do
    Master_mind.setGuessArray([4,2,2,1])
    Master_mind.returnGuessArray.should == [4,2,2,1]
  end

  [
      [[1,3,2,4],[3,2,2,5], [2,1] ],
      [[4,5,6,7], [1,2,3,8], []],
      [[2,2,2,2], [2,2,2,2], [2,2,2,2]],
      [[3,3,2,2], [3,2,2,3], [2,2,1,1]],
      [[1,2,3,4], [4,3,2,1], [1,1,1,1]]


  ].each do  | guess, solution, out|
        it "should return the output " do
        Master_mind.setGuessArray(guess)
        Master_mind.setSolutionArray(solution)
        Master_mind.getOutputArray.should == out
      end
  end

  it "should set and return the array of old guesses" do
    Master_mind.addToOldGuesses([4,4,4,4])
    Master_mind.returnOldGuesses.should == [[4,4,4,4]]
    Master_mind.addToOldGuesses([3,2,3,2])
    Master_mind.returnOldGuesses.should == [[4,4,4,4],[3,2,3,2]]
    Master_mind.clearOldGuesses
    Master_mind.returnOldGuesses.should == []
  end

  it "should set and return the array of old outputs" do
    Master_mind.addToOldOutputs([4,4,4,4])
    Master_mind.returnOldOutputs.should == [[4,4,4,4]]
    Master_mind.addToOldOutputs([3,2,3,2])
    Master_mind.returnOldOutputs.should == [[4,4,4,4],[3,2,3,2]]
    Master_mind.clearOldOutputs
    Master_mind.returnOldOutputs.should == []
  end

  it "should only accept a guess of the correct length" do
    Master_mind.setSolutionArray([3,5,6,7])
    Master_mind.setGuessArray([3,4,5]).should == false
  end

  it "should set a solution array of size n if n > 2 and n< 10" do
    Master_mind.setSizeOfSolutionAndGenerateIt(3)
    Master_mind.returnSolutionArray.size.should == 3
    Master_mind.setSizeOfSolutionAndGenerateIt(2).should == false
  end

end
