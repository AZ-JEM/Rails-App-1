class UserMailer < ApplicationMailer

  default from: "txazjem@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'txazjem@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Polar Clock Shop"
      mail(to: user.email,
           subject: "Welcome to #{@appname}!")
  end

end
