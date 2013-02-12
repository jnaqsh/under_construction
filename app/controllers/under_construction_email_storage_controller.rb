class UnderConstructionEmailStorageController < ApplicationController
  def create
    @email = UnderConstructionEmailStorage.new(params[:under_construction_email_storage])

    respond_to do |format|
      if @email.valid?
        @email.save_to_file
        @notice = I18n.t('controllers.under_construction_email_storage.create.flash.success', default: "Your email added successfully")
        format.html { redirect_to under_construction_index_path,
          notice: I18n.t('controllers.under_construction_email_storage.create.flash.success',
                  default: "Your email added successfully"
          )}
        # TODO: UnderConstruction.config won't update if config file changes
        format.js { render template: "under_construction/#{UnderConstruction.config.theme}/create" }
      else
        @alert = @email.errors.full_messages[0]
        # TODO: UnderConstruction.config won't update if config file changes
        format.html { redirect_to under_construction_index_path, alert: @email.errors.full_messages }
        format.js { render template: "under_construction/#{UnderConstruction.config.theme}/create" }
      end
    end
  end
end
