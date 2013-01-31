desc "Send notify emails to users submited their email to underconstruction page"
namespace :under_construction do
  task :send_mails => :environment do
    if File.exist? Rails.root + "db/under_construction_emails.txt"
      UnderConstructionEmailStorage.emails.each do |email|
        NotifyUnderConstructionSubmittedMails.under_construction_notify(email.chomp).deliver
      end
    else
      puts "There's no email submitted"
    end
  end
end