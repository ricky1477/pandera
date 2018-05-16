task :daily_report => :environment do
  DailyReportMailer.daily_report().deliver_now
end
