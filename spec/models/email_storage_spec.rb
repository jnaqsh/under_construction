require 'spec_helper'

describe EmailStorage do
  it 'validates presence of email' do
    expect(FactoryGirl.build :email_storage).to be_valid
  end

  it 'validates format of email' do
    expect(FactoryGirl.build :email_storage, email: "test").to be_invalid
  end

  it 'validates uniquness of email' do
    FactoryGirl.create :email_storage
    expect(FactoryGirl.build :email_storage).to be_invalid
  end
end
