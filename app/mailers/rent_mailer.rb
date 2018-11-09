class RentMailer < ApplicationMailer
  def new_rent(rent)
    @rent = rent
    @book = @rent.book
    @user = @rent.user
    subject = t('send_mail.mail_new_rent')
    mail(to: @user.email, subject: subject) if @book.present? && @rent.present?
  end

  def expired_rent(id_rent)
    @rent = Rent.find(id_rent)
    @book = @rent.book
    @user = @rent.user
    mail(to: @user.email, subject: t('send_mail.mail_expired_rent'))
  end
end
