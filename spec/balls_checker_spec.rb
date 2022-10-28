require_relative '../balls_checker'

RSpec.describe BallsChecker do
  let(:balls) {[]}
  let(:balls_checker) { described_class.new(balls) }

  describe "#perform" do
    context "when there are less balls than winning score" do
      let(:balls) {[[0,0], [0, 1], [0, 2]]}

      it "returns false" do
        expect(balls_checker.perform).to be_falsey
      end
    end

    context "when balls do not make any of combinations" do
      let(:balls) { [[0,0], [0, 1], [0, 2], [0, 6]] }

      it "returns false" do
        expect(balls_checker.perform).to be_falsey
      end
    end

    context "when 4 balls are in a vertical winning condition" do
      let(:balls) { [[0,5], [0, 3], [0, 2], [0, 4]] }

      it "returns false" do
        expect(balls_checker.perform).to be_truthy
      end
    end

    context "when 4 balls are in a horizontal winning condition" do
      let(:balls) { [[1,5], [3, 5], [2, 5], [0, 5]] }

      it "returns false" do
        expect(balls_checker.perform).to be_truthy
      end
    end

    context "when 4 balls are in a left angled diagonal winning condition" do
      let(:balls) { [[3, 5], [4, 4], [6, 2], [5, 3]] }

      it "returns false" do
        expect(balls_checker.perform).to be_truthy
      end
    end

    context "when 4 balls are in a right angled diagonal winning condition" do
      let(:balls) { [[1, 1], [3, 3], [2, 2], [0, 0]] }

      it "returns false" do
        expect(balls_checker.perform).to be_truthy
      end
    end
  end
end
