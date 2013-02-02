require 'spec_helper'

describe UnderConstructionEmailStorage do
  let(:mail) { UnderConstructionEmailStorage }
  before do
    mail.remove_file
  end
  it 'validates presence of email' do
    expect(mail.new email: "test@example.com").to be_valid
  end

  it 'validates format of email' do
    expect(mail.new email: "test").to be_invalid
  end

  it 'validates uniquness of email' do
    mail1 = mail.new email: "test@example.com"
    mail1.save_to_file
    expect(mail.new email: "test@example.com").to be_invalid
  end
end
