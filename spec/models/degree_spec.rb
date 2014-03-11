require 'spec_helper'

describe Degree do
  it "is valid with a name" do
    expect(build(:degree)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:degree, name: nil)).to have(1).errors_on(:name)
  end
end
