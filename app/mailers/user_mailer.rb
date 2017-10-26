class UserMailer < ApplicationMailer
  default from: "carlos.rojas.burgos@gmail.com"

  def contact_send(user, publication, name_sent, phone_sent, email_sent, message_sent)
   @user = user
   @publication = publication
   @name_sent = name_sent
   @phone_sent = phone_sent
   @email_sent = email_sent
   @message_sent = message_sent 
   mail(to: @publication.user.email, subject: @publication.title)
   end 
end
