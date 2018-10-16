class MyDeviseMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  include Devise::Mailers::Helpers
  default from: 'AC Portal <info@ac-portal.com>', template_path: 'mailers', template_name: 'default'

  def invitation_instructions(record, token, opts={})
    @token = token
    @scope_name = Devise::Mapping.find_scope!(record)
    @resource = instance_variable_set("@#{devise_mapping.name}", record)
    headers 'X-SMTPAPI' => {
        sub: {
            '%email%' => [@resource.email],
            '%accept_invitation_url%' => [accept_invitation_url(@resource, invitation_token: @token)]
        },
        filters: {
            templates: {
                settings: {
                    enable: 1,
                    template_id: ENV['INVITATION_TEMPLATE_ID']
                }
            }
        }
    }.to_json
    devise_mail(record, :invitation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    @scope_name = Devise::Mapping.find_scope!(record)
    @resource = instance_variable_set("@#{devise_mapping.name}", record)
    headers 'X-SMTPAPI' => {
        sub: {
            '%edit_password_url%' => [edit_password_url(@resource, reset_password_token: @token)]
        },
        filters: {
            templates: {
                settings: {
                    enable: 1,
                    template_id: ENV['RESET_PASSWORD_INSTRUCTIONS_TEMPLATE_ID']
                }
            }
        }
    }.to_json
    devise_mail(record, :reset_password_instructions, opts)
  end
end
