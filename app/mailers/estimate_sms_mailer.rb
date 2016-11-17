class EstimateSmsMailer < ApplicationMailer
   def estimate_created(estimate)
       @estimate = estimate
       mail to: estimate.client.phone+estimate.client.sms_gateway,
            subject: 'Your estimate is ready to be seen!'
   end
end
