require 'spec_helper'

describe Expertise do
  it "is valid with a subject, provider, and experience" do
    e = Expertise.new(
      subject: Subject.new,
      provider: Provider.new,
      experience: 5)
    expect(e).to be_valid
  end

  it "is invalid without a subject" do
    expect(Expertise.new(subject: nil)).to have(1).errors_on(:subject)
  end

  it "is invalid without a provider" do
    expect(Expertise.new(provider: nil)).to have(1).errors_on(:provider)
  end

  it "is invalid without an experience" do
    expect(Expertise.new(experience: nil)).to have(2).errors_on(:experience)
  end

  it "is invalid without a experience greater than zero" do
    expect(Expertise.new(experience: 0)).to have(1).errors_on(:experience)
  end
end
