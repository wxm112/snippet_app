class ExampleMailer < ApplicationMailer
  default from: "may.wang112@gmail.com"

  def active_email(user)
    @user = user
    mail(to: @user.email, subject: 'Active your account')
  end

  def add_to_group_email(user,invitater,group)
    @user = user
    @current_user = invitater
    @group = group
    mail(to: @user.email, subject: 'Invitation to a group')
  end
end
