require_relative '../board'

RSpec.describe Board do
  let(:board) { described_class.new }

  describe ".initialize" do
    it "creates a board with prefilled state information" do
      expect(board.state.size).to eq(6*7)
    end
    
    it "creates a board with nil value for player data" do
      expect(board.state.map{|b| b[2]}.any?).to be_falsey
    end
  end

  describe "#place_ball" do
    it "places a ball in a free position of specific column" do
      board.place_ball(2, "red")
      expect(board.place_ball(2, "red")).to eq([2, 1])
    end

    context "when column is bigger then board size" do
      it "raises an error" do
        expect{ board.place_ball(8, "red") }.to raise_error(StandardError)
      end
    end

    context "when column value is negative" do
      it "raises an error" do
        expect{ board.place_ball(-1, "red") }.to raise_error(StandardError)
      end
    end

    context "when column is already full" do
      it "raises an error" do
        3.times do
          board.place_ball(1, "red")
        end
        3.times do
          board.place_ball(1, "red")
        end
        expect{  board.place_ball(1, "red") }.to raise_error(StandardError)
      end
    end
  end
end
