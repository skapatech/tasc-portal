require 'spec_helper'

describe Language do
  it "is valid with a name" do
    expect(Language.new(name: 'English')).to be_valid
  end

  it "is invalid without a name" do
    expect(Language.new()).to have(1).errors_on(:name)
  end
end
