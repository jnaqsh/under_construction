module EmailStorageHelper
  def view_flash_messages
    flash.each do |type, msgs|
      if msgs.is_a? String
        msgs = [msgs]
      end

      msgs.each do |msg|
        return content_tag(:p, msg, class: "flash #{type}") unless msg.empty?
      end
    end
  end
end