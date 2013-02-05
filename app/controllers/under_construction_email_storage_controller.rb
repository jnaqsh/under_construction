class UnderConstructionEmailStorageController < ApplicationController
  def create
    @email = UnderConstructionEmailStorage.new(params[:under_construction_email_storage])

    respond_to do |format|
      if @email.valid?
        @email.save_to_file
        format.html { redirect_to under_construction_index_path,
          notice: I18n.t('controllers.under_construction_email_storage.create.flash.success',
                  default: "Your email added successfully"
          )}
      else
        format.html { redirect_to under_construction_index_path, alert: @email.errors.full_messages }
      end
    end
  end
end
