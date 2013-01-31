class NotifyUnderConstructionSubmittedMails < ActionMailer::Base
  default from: UnderConstruction.config.notify_mail["sender_email_address"]
  
  def under_construction_notify(email)
    mail to: email, subject: UnderConstruction.config.notify_mail["email_subject"]
  end
end
