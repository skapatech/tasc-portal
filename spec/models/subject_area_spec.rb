require 'spec_helper'

describe SubjectArea do
  it "is valid with a name" do
    e = SubjectArea.new(name: 'test')
    expect(e).to be_valid
  end

  it "is invalid without a name" do
    expect(SubjectArea.new(name: nil)).to have(1).errors_on(:name)
  end
end
