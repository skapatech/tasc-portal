require 'spec_helper'

describe Speaks do
  it "is valid with a provider and language" do 
    expect(build(:speak)).to be_valid
  end

  it "is invalid without a provider" do
    s = build(:speak, provider_id: nil)
    expect(s).to have(1).errors_on(:provider_id)
  end

  it "is invalid without a language" do
    s = build(:speak, language_id: nil)
    expect(s).to have(1).errors_on(:language_id)
  end
end
