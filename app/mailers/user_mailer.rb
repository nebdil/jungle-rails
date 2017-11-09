class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
<<<<<<< HEAD
  def welcome_email(user)
    @user = User.first
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
=======
  def welcome_email(order)
    @order = order
    mail(to: @order.email, subject: "Your order ID is: #{@order.id}")
>>>>>>> feature/order-receipt
  end
end
