require_relative '../balls_counter_helper'

RSpec.describe BallsCounterHelper do
  let(:balls) {[]}
  let(:helper) { described_class.new(balls) }

  describe "#calculate" do
    context "when we are incrementing check value" do
      context "there are both values and nils" do
        let(:balls) {[[1,1], [3,5], [2,2],[0,0]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(true, true)).to eq(2)
        end
      end

      context "there are only nils" do
        let(:balls) {[[2,1], [1,5], [4,1],[0,0]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(true, true)).to eq(0)
        end
      end

      context "there are only values" do
        let(:balls) {[[1,1], [3,5], [3, 3], [2,2],[0,0]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(true, true)).to eq(3)
        end
      end
    end

    context "when we are incrementing only one value" do
      context "there are both values and nils" do
        let(:balls) {[[1,1], [3,2], [2,1],[0,1]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(true, nil)).to eq(2)
        end
      end

      context "there are only nils" do
        let(:balls) {[[2,1], [1,5], [4,1],[0,0]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(true, nil)).to eq(0)
        end
      end

      context "there are only values" do
        let(:balls) {[[1,1], [3,1], [2,1],[0,1]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(true, nil)).to eq(3)
        end
      end
    end

    context "when we are incrementing one value and decrease another" do
      context "there are both values and nils" do
        let(:balls) {[[4,2], [3,2], [3,3],[5,1]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(false, true)).to eq(2)
        end
      end

      context "there are only nils" do
        let(:balls) {[[2,1], [1,5], [4,1],[0,0]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(false, true)).to eq(0)
        end
      end

      context "there are only values" do
        let(:balls) {[[4,2], [3,3], [2,4],[5,1]]}
        
        it "returns correct amount of values" do
          expect(helper.calculate(false, true)).to eq(3)
        end
      end
    end
  end
end
