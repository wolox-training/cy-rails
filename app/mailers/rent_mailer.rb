class RentMailer < ApplicationMailer
  def new_rent(rent)
    @rent = rent
    @book = Book.find(@rent.book_id)
    @user = User.find(@rent.user_id)
    mail(to: @user.email, subject: 'Mail new rent')
  end
end
