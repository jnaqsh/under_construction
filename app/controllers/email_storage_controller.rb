class EmailStorageController < ApplicationController
  def create
    @email = EmailStorage.new(params[:email_storage])
    respond_to do |format|
      if @email.save
        format.html { redirect_to under_construction_path, notice: 'Email added successfully' }
      else
        format.html { redirect_to under_construction_path, alert: @email.errors.full_messages }
      end
    end
  end
end
