require "spec_helper"

describe NotifyUnderConstructionSubmittedMails do
  let(:mail) { ["mail@example.com"] }

  before do
    UnderConstructionEmailStorage.stub(:emails) { mail }
  end

  it "should send notify mails" do
    notify = NotifyUnderConstructionSubmittedMails.under_construction_notify(mail)
    notify.subject.should eq(UnderConstruction.config.notify_mail["email_subject"])
    notify.to.should eq(mail)
    notify.from.should eq([UnderConstruction.config.notify_mail["sender_email_address"]])
  end
end
