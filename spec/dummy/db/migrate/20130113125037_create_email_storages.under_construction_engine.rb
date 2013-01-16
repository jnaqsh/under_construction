# This migration comes from under_construction_engine (originally 20130113103509)
class CreateEmailStorages < ActiveRecord::Migration
  def change
    create_table :email_storages do |t|
      t.string :email

      t.timestamps
    end
  end
end
