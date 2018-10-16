class OnboardingMailer < ApplicationMailer

  def admin_onboarding(resource)
    @resource = resource
    headers 'X-SMTPAPI' => {
        sub: {
            '%email%' => [@resource.email],
            '%root_url%' => [root_url]
        },
        filters: {
            templates: {
                settings: {
                    enable: 1,
                    template_id: ENV['ADMIN_ONBOARDING_TEMPLATE_ID']
                }
            }
        }
    }.to_json
    mail(to: @resource.email, subject: 'Welcome to the AC Portal')
  end

  def mentor_onboarding(resource)
    @resource = resource
    headers 'X-SMTPAPI' => {
        sub: {
            '%email%' => [@resource.email],
            '%root_url%' => [root_url]
        },
        filters: {
            templates: {
                settings: {
                    enable: 1,
                    template_id: ENV['MENTOR_ONBOARDING_TEMPLATE_ID']
                }
            }
        }
    }.to_json
    mail(to: @resource.email, subject: 'Welcome to the AC Portal')
  end

  def client_onboarding(resource)
    @resource = resource
    headers 'X-SMTPAPI' => {
        sub: {
            '%email%' => [@resource.email],
            '%root_url%' => [root_url]
        },
        filters: {
            templates: {
                settings: {
                    enable: 1,
                    template_id: ENV['CLIENT_ONBOARDING_TEMPLATE_ID']
                }
            }
        }
    }.to_json
    mail(to: @resource.email, subject: 'Welcome to the AC Portal')
  end
end
