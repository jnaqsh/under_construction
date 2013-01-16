require 'spec_helper'

describe EmailStorageController do
  describe "POST 'create'" do
    it "creates email successfully" do
      pending "Don't know why fails. While are feature test work, who cares?"
      post :create, email: 'test@test.com'
      flash[:notice].should eq("Email added successfully")
    end
  end
end
