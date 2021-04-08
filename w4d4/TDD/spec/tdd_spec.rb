require 'tdd'
require 'rspec'

# reminder: you can do iterations in spec file
# note: to not change
describe '#my_uniq' do
    it "returns unique elements" do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end

    it "returns a new array" do
        arr = [1, 2, 1, 3, 3]
        expect(my_uniq(arr)).to_not be([1,2,3])
    end    
end

describe 'Array#two_sum' do
    subject(:arr) { [-1, 0, 2, -2, 1] }
    # need to get all positions & order/index is correct
    # before (:each) do #ensures variable
    
    it "finds all pairs of positions where elements sum to zero." do
        expect(arr.two_sum).to eq([[0,4],[2,3]])
    end

    it "returns in correct order" do
        expect(arr.two_sum).to_not eq([[2,3],[0,4]])
    end
end

describe '#my_transpose' do
    subject(:matrix) { [[0, 1, 2],[3, 4, 5],[6, 7, 8]]}
    # before(:each) do
    #     expect_any_instance_of(Array).not_to receive(:transpose)
    # end
    
    it "transposes two-dimensional array" do
        transposed = [[0, 3, 6],[1, 4, 7],[2, 5, 8]]
        expect(my_transpose(matrix)).to eq(transposed)
    end
end

describe '#stock_picker' do


end