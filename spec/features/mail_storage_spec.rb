require 'spec_helper'

describe "Email Storage Feature Test" do
  it "sumbits email successfully" do
    visit under_construction_path
    fill_in 'email', with: 'test@test.com'
    click_button :submit
    current_path.should eq(under_construction_path)
    page.should have_content('Email added successfully')
  end
end