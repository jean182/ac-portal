class ApplicationMailer < ActionMailer::Base
  default from: 'AC Portal <info@ac-portal.com>', template_path: 'mailers', template_name: 'default'
  layout 'mailer'
end
