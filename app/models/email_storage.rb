class EmailStorage < ActiveRecord::Base
  attr_accessible :email

  validates :email, uniqueness: true, presence: true, 
            format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, 
                      message: "Doesn't looks like correct" }
end
