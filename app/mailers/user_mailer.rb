class UserMailer < ApplicationMailer
  default from: "juliannbeals@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
        to: 'juliannbeals@gmail.com',
        subject: "A new contact form message from #{name}")
  end

  def welcome(user)
  @appname = "Prague Yoga Collective"
  mail(to: user.email,
    subject: "Welcome to #{@appname}!")
  end

  def order_confirmation(user)
  @user = user
  @appname = "Prague Yoga Collective"
  mail(to: user.email,
    subject: "Your order has been received")
  end

end
