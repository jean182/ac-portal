module BootstrapHelper
  def action_status(_action)
    status = ""
    case _action
    when "active"
      status = "info"
    when "completed"
      status = "success"
    when "inactive"
      status = "secondary"
    end
  end
end
