require_relative '../game'

RSpec.describe Game do
  describe "#move" do
    let(:game) { described_class.new }
    let(:red_player) { game.players.find{|p| p.color == "red"} }

    context "when player color is not declared" do
      it "raises an error" do
        expect{ game.move(1, "green") }.to raise_error(StandardError)
      end
    end

    context "when game is still going" do
      it "returns true" do
        expect(game.move(1, "red")).to be_truthy
      end

      it "prints next player turn message" do
        expect{ game.move(1, "red") }.to output(/Next player turn/).to_stdout
      end

      it "adds a ball to players balls" do
        expect{ game.move(1, "red") }.to change{red_player.balls.count}.by(1)
      end

      it "sets a correct ball to players balls" do
        game.move(1, "red")
        game.move(1, "red")
        expect(red_player.balls.count).to eq(2)
        expect(red_player.balls.last).to eq([1, 1])
      end
    end

    context "when person perfoms winning turn" do
      before do
        3.times do
          game.move(1, "red")
        end
      end

      it "prints that player won a match" do
        expect{ game.move(1, "red") }.to output(/red player wins!/).to_stdout
      end

      it "sets winner attribute to player" do
        expect{ game.move(1, "red") }.to change{ red_player.winner }.from(false).to(true)
      end
    end

    context "when game already ended" do
      before do
        4.times do
          game.move(1, "red")
        end
      end

      it "prints that game is over" do
        expect{ game.move(1, "yellow") }.to output(/game is over/).to_stdout
      end

      it "does not set a ball in any place on a board" do
        expect{ game.move(1, "red") }.not_to change{ game.board.state }
      end

      it "does not add a ball to any players balls" do
        yellow_player = game.players.find{|p| p.color == "yellow"}

        expect{ game.move(1, "red") }.not_to change{ red_player.balls }
        expect{ game.move(3, "yellow") }.not_to change{ yellow_player.balls }
      end
    end
  end
end
