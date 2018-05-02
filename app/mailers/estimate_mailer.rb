class EstimateMailer < ApplicationMailer
    def estimate_created(estimate)
       @estimate = estimate
        mail to: estimate.client.email,
            cc: estimate.client.email2,
            subject: 'Your estimate is ready to be seen!'
    end
end
