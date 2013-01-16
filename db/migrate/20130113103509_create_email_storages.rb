class CreateEmailStorages < ActiveRecord::Migration
  def change
    create_table :email_storages do |t|
      t.string :email

      t.timestamps
    end
  end
end
