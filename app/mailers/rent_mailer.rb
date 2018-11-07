class RentMailer < ApplicationMailer
  def new_rent(rent)
    @rent = rent
    @book = Book.find(@rent.book)
    @user = User.find(@rent.user)
    mail(to: @user.email, subject: t('send_mail.mail_new_rent'))
  end
end
