require_relative '../player'

RSpec.describe Player do
  let(:player) { described_class.new("red") }

  describe ".initialize" do
    it "creates a player that is not a winner" do
      expect(player.winner).to be_falsey
    end
    
    it "creates a player with empty list of balls" do
      expect(player.balls).to eq([])
    end
  end

  describe "#add_ball" do
    it "adds a ball to the list" do
      expect{ player.add_ball([0, 1]) }.to change{ player.balls.count }.by(1)
    end

    context "when ball is a winning one" do
      it "adds a ball to the list" do
        player.add_ball([0, 0])
        player.add_ball([0, 1])
        player.add_ball([0, 2])
        expect{ player.add_ball([0, 3]) }.to change{ player.winner }.from(false).to(true)
      end
    end
  end
end
