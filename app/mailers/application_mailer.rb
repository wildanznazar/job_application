class ApplicationMailer < ActionMailer::Base
  default from: %("Job Care" <no_replay@jobcare.id>)
  layout 'mailer'
end
