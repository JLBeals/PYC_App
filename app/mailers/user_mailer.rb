class UserMailer < ApplicationMailer
  default from: "juliannbeals@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
        to: 'juliannbeals@gmail.com',
        subject: "A new contact form message from #{name}")
  end
end
