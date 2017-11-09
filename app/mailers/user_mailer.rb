class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  def welcome_email(order)
    @order = order
    mail(to: @order.email, subject: "Your order ID is: #{@order.id}")
  end
end
