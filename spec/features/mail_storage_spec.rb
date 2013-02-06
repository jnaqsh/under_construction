require 'spec_helper'

def remove_emails_file
  path = "spec/dummy/db/under_construction_mails.txt"
  if File.exist?(path)
    FileUtils.rm(File.expand_path path)
  end
end

describe "Email Storage Feature Test" do
  before do
    remove_emails_file
  end

  it "sumbits email successfully" do
    pending 'There are no routes file'
    visit under_construction_index_path
    fill_in 'email', with: 'test@test.com'
    click_button :submit
    current_path.should eq(under_construction_index_path)
    page.should have_content('Email added successfully')
  end
end
