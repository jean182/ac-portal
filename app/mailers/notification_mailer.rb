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
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['TASK_COMPLETED_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @mentor.email, subject: "#{@client.name} finished a task")
  end

  def task_refused_notification(client, user, company_task)
    @user = user
    @client = client
    @company_task = company_task
    headers 'X-SMTPAPI' => {
      sub: {
        '%user_name%' => [@user.name],
        '%client_name%' => [@client.name],
        '%task_description%' => [@company_task.task.description],
        '%company_id%' => [@company_task.company.id],
        '%phase_id%' => [@company_task.company.current_phase.phase.phase_number],
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['TASK_REFUSED_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @client.email, subject: "#{@client.name} finished a task")
  end

  def task_approved_notification(client, user, company_task)
    @user = user
    @client = client
    @company_task = company_task
    headers 'X-SMTPAPI' => {
      sub: {
        '%user_name%' => [@user.name],
        '%client_name%' => [@client.name],
        '%task_description%' => [@company_task.task.description],
        '%company_id%' => [@company_task.company.id],
        '%phase_id%' => [@company_task.company.current_phase.phase.phase_number],
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['TASK_APPROVED_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @client.email, subject: "#{@client.name} finished a task")
  end

  def milestone_completed_notification(admin, client, milestone)
    @admin = admin
    @client = client
    @milestone = milestone
    headers 'X-SMTPAPI' => {
      sub: {
        '%admin_name%' => [@admin.name],
        '%client_name%' => [@client.name],
        '%milestone_title%' => [@milestone.title],
        '%company_id%' => [@milestone.company_phase.company.id],
        '%phase_id%' => [@milestone.company_phase.phase.phase_number],
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['MILESTONE_COMPLETED_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @admin.email, subject: "#{@client.name} finished a milestone")
  end

  def milestone_approved_notification(client, admin, milestone)
    @admin = admin
    @client = client
    @milestone = milestone
    headers 'X-SMTPAPI' => {
      sub: {
        '%admin_name%' => [@admin.name],
        '%client_name%' => [@client.name],
        '%milestone_title%' => [@milestone.title],
        '%company_id%' => [@milestone.company_phase.company.id],
        '%phase_id%' => [@milestone.company_phase.phase.phase_number],
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['MILESTONE_APPROVED_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @client.email, subject: "#{@admin.name} approved a milestone")
  end

  def milestone_refused_notification(client, admin, milestone)
    @admin = admin
    @client = client
    @milestone = milestone
    headers 'X-SMTPAPI' => {
      sub: {
        '%admin_name%' => [@admin.name],
        '%client_name%' => [@client.name],
        '%milestone_title%' => [@milestone.title],
        '%company_id%' => [@milestone.company_phase.company.id],
        '%phase_id%' => [@milestone.company_phase.phase.phase_number],
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['MILESTONE_REFUSED_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @client.email, subject: "#{@admin.name} did not approve the milestone")
  end

  def new_task_message(mentor, client, company_task)
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
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['NEW_MESSAGE_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @mentor.email, subject: "#{@client.name} wrote a new message")
  end

  def quota_exceeded_notification(admin, company, month)
    @admin = admin
    @company = company
    @month = month
    headers 'X-SMTPAPI' => {
      sub: {
        '%admin_name%' => [@admin.name],
        '%company_name%' => [@company.name],
        '%company_id%' => [@company.id],
        '%month%' => [@month],
        '%root_url%' => [root_url],
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: ENV['QUOTA_EXCEEDED_EMAIL_TEMPLATE_ID'],
          },
        },
      },
    }.to_json
    mail(to: @admin.email, subject: "#{@company.name} has exceeded their monthly quota")
  end

end
