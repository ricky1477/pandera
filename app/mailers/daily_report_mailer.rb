class DailyReportMailer < ApplicationMailer
    def daily_report()
        mail to: ShippingAddress.where(is_default: true).first.email,
            subject: 'Here is your daily report!'
    end
end
