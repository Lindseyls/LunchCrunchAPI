require "test_helper"

describe Restaurant do
  let(:restaurant) { Restaurant.new }

  it "must be valid" do
    value(restaurant).must_be :valid?
  end
end
