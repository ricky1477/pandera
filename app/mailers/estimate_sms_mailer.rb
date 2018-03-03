class EstimateSmsMailer < ApplicationMailer
   def estimate_created(estimate)
       @estimate = estimate
       mail to: estimate.client.curated_phone+estimate.client.sms_gateway,
            cc: estimate.client.curated_phone2+estimate.client.sms_gateway2,
            subject: 'Your estimate is ready to be seen!'
   end
end
