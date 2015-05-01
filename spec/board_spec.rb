require 'rspec'
require 'board.rb'

board = CheckerBoard.new
board.set_board

describe "#on_board?" do

  it "returns false" do
    expect(board.on_board?([-1,5])).to eq(false)
  end

  it "returns true" do
    expect(board.on_board?([3,3])).to eq(true)
  end
end

describe "#perform_moves" do

  it
