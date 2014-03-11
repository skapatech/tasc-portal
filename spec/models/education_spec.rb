require 'spec_helper'

describe Education do
  it "is valid with a provider_id, degree_id, and major" do
    expect(build(:education)).to be_valid
  end

  it "is invalid without a provider_id" do
    expect(build(:education, provider_id: nil)).to have(1).errors_on(:provider_id)
  end

  it "is invalid without a degree_id" do
    expect(build(:education, degree_id: nil)).to have(1).errors_on(:degree_id)
  end

  it "is invalid without a major" do
    expect(build(:education, major: nil)).to have(1).errors_on(:major)
  end
end
