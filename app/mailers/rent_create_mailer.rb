class RentCreateMailer < ApplicationMailer
  def create_rent(rent)
    @rent = rent
    @book = @rent.book
    @user = @rent.user
    subject = t('send_mail.mail_new_rent')
    mail(to: @user.email, subject: subject) if @book.present? && @rent.present?
  end
end
