require 'spec_helper'

describe Provider do
  it "is valid with a first name, last name, address1, zip, rate, position, organization, resume, at least one expertise" do
    p = Provider.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      address1: '123 street',
      zip: '12345',
      rate: 75,
      position: 'software engineer',
      organization: 'thomson reuters',
      resume: 'this is my fancy resume')
    p.expertises << Expertise.new(experience: 5, 
      subject: Subject.new(name: 'test subject', 
        subject_area: SubjectArea.new(name: 'test area', is_technical: true)))
    expect(p).to be_valid
  end

  it "is invalid without a first name" do
    expect(Provider.new(first_name: nil)).to have(1).errors_on(:first_name)
  end

  it "is invalid without a last name" do
    expect(Provider.new(last_name: nil)).to have(1).errors_on(:last_name)
  end

  it "is invalid without an address1" do
    expect(Provider.new(address1: nil)).to have(1).errors_on(:address1)
  end

  it "is invalid without a zip" do
    expect(Provider.new(zip: nil)).to have(1).errors_on(:zip)
  end

  it "is invalid without a rate" do
    expect(Provider.new(rate: nil)).to have(2).errors_on(:rate)
  end

  it "is invalid without a rate greater than zero" do
    expect(Provider.new(rate: 0)).to have(1).errors_on(:rate)
  end

  it "is invalid without a position" do
    expect(Provider.new(position: nil)).to have(1).errors_on(:position)
  end

  it "is invalid without a organization" do
    expect(Provider.new(organization: nil)).to have(1).errors_on(:organization)
  end

  it "is invalid without a resume" do
    expect(Provider.new(resume: nil)).to have(1).errors_on(:resume)
  end

  it "is invalid without at least one expertise" do
    expect(Provider.new(expertises: [])).to have(1).errors_on(:expertises)
  end
end
