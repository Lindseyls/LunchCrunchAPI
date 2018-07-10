require "test_helper"

describe PopularTime do
  let(:popular_time) { PopularTime.new }

  it "must be valid" do
    value(popular_time).must_be :valid?
  end
end
