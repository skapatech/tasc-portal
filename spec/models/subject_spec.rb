require 'spec_helper'

describe Subject do
  it "is valid with a subject and name" do
    e = Subject.new(
      subject_area: SubjectArea.new,
      name: 'test')
    expect(e).to be_valid
  end

  it "is invalid without a subject area" do
    expect(Subject.new(subject_area: nil)).to have(1).errors_on(:subject_area)
  end

  it "is invalid without a name" do
    expect(Subject.new(name: nil)).to have(1).errors_on(:name)
  end
end
