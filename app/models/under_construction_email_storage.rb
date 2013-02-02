class UnderConstructionEmailStorage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email
  FILE_PATH = Rails.root + "db/under_construction_mails.txt"

    class UniquenessValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        emails_path = Rails.root + "db/under_construction_mails.txt"
        if File.exist? emails_path
          File.open(emails_path, "r") do |f|
            if f.readlines.include? value + "\n"
              record.errors[attribute] << (options[:message] || "already submitted")
            end
          end
        end
      end
    end

  validates :email, presence: true, uniqueness: true,
            format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, 
                      message: "doesn't looks like correct" }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  # save submitted mail to a text file
  def save_to_file
    File.open(FILE_PATH, "a") do |f|
      f.puts email
    end
  end

  # return emails in a array
  def self.emails
    File.open(FILE_PATH, "r") do |f|
      f.readlines
    end
  rescue Errno::ENOENT
    []
  end

  def self.no_emails?
    emails.empty?
  end

  def self.remove_file
    if File.exist? FILE_PATH
      FileUtils.rm FILE_PATH
    end
  end
end