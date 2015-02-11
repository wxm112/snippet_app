class ExampleMailer < ApplicationMailer
  default from: "may.wang112@gmail.com"

  def active_email(user)
    @user = user
    mail(to: @user.email, subject: 'Active your account')
  end
end
