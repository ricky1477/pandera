class ApplicationMailer < ActionMailer::Base
  default from: "pandera.system@gmail.com"
  #default reply_to: ShippingAddress.where("is_default IS TRUE").first.email
  layout 'mailer'
end
