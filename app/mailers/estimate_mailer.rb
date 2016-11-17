class EstimateMailer < ApplicationMailer
    def estimate_created(estimate)
       @estimate = estimate
        mail to: estimate.client.email,
            subject: 'Your estimate is ready to be seen!'
    end
end
