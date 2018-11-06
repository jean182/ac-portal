class NotificationMailer < ApplicationMailer

  def task_completed_notification(mentor, client, company_task)
    @mentor = mentor
    @client = client
    @company_task = company_task
    headers 'X-SMTPAPI' => {
        sub: {
            '%mentor_name%' => [@mentor.name],
            '%client_name%' => [@client.name],
            '%task_description%' => [@company_task.task.description],
            '%company_id%' => [@company_task.company.id],
            '%phase_id%' => [@company_task.company.current_phase.phase.phase_number],
            '%root_url%' => [root_url]
        },
        filters: {
            templates: {
                settings: {
                    enable: 1,
                    template_id: ENV['TASK_COMPLETED_EMAIL_TEMPLATE_ID']
                }
            }
        }
    }.to_json
    mail(to: @mentor.email, subject: "#{@client.name} finished a task")
  end

end
