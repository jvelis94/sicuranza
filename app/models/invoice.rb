class Invoice < ApplicationRecord
    belongs_to :work_order
    # has_many :invoice_items, dependent: :destroy
    after_create :send_invoice_email

    invoice = Invoice.last
    # STATUS_CLASS = {
    #     :draft => "badge badge-secondary",
    #     :sent => "badge badge-primary",
    #     :paid => "badge badge-success"
    # }

    # def subtotal
    #     self.invoice_items.map { |item| item.qty * item.price }.sum
    # end

    # def discount_calculated
    #     subtotal * (self.discount / 100.0)
    # end

    # def vat_calculated
    #     (subtotal - discount_calculated) * (self.vat / 100.0)
    # end

    # def total
    #     subtotal - discount_calculated + vat_calculated
    # end

    # def status_class
    #     STATUS_CLASS[self.status.to_sym]
    # end
    def send_invoice_email
        UserMailer.with(invoice: self).invoice.deliver_now
    end

end
