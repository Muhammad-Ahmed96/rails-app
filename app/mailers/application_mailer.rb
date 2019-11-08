class ApplicationMailer < Devise::Mailer
  layout 'mailer'

  before_action :add_attachment

  private

  def add_attachment
    attachments.inline["smiley.png"] = File.read(Rails.root.join("app/assets/images/smiley.png"))
  end
end
