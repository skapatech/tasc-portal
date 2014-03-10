require 'spec_helper'

describe Provider do
  it "is valid with a first name, last name, address1, zip, rate, position, organization, resume, at least one expertise" do
    p = build(:provider)
    #p.expertises << Expertise.new()
    expect(p).to be_valid
  end

  it "is invalid without a first name" do
    provider = build(:provider, first_name: nil)
    expect(provider).to have(1).errors_on(:first_name)
  end

  it "is invalid without a last name" do
    provider = build(:provider, last_name: nil)
    expect(provider).to have(1).errors_on(:last_name)
  end

  it "is invalid without an address1" do
    provider = build(:provider, address1: nil)
    expect(provider).to have(1).errors_on(:address1)
  end

  it "is invalid without a zip" do
    provider = build(:provider, zip: nil)
    expect(provider).to have(1).errors_on(:zip)
  end

  it "is invalid without a rate" do
    provider = build(:provider, rate: nil)
    expect(provider).to have(1).errors_on(:rate)
  end

  it "is invalid without a rate greater than zero" do
    provider = build(:provider, rate: 0)
    expect(provider).to have(1).errors_on(:rate)
  end

  it "is invalid without a position" do
    provider = build(:provider, position: nil)
    expect(provider).to have(1).errors_on(:position)
  end

  it "is invalid without a organization" do
    provider = build(:provider, organization: nil)
    expect(provider).to have(1).errors_on(:organization)
  end

  it "is invalid without a resume" do
    provider = build(:provider, resume: nil)
    expect(provider).to have(1).errors_on(:resume)
  end

  it "is invalid with a duplicate email address" do
    create(:provider, email: "aaron@example.com")
    contact = build(:provider, email: "aaron@example.com")
    expect(contact).to have(1).errors_on(:email)
  end
  # it "is invalid without at least one expertise" do
  #   expect(Provider.new(expertises: [])).to have(1).errors_on(:expertises)
  # end
end
