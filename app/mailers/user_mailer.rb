class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invoice.subject
  #
  def invoice
    
    @invoice = params[:invoice]

    mail(to: @invoice.work_order.customer_email, subject: 'Invoice Details Enclosed')
  end
end
