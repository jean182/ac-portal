module StatusHelper
  def disabled_user(status)
    'text-muted' unless status.nil?
  end

  def exceeded_quota(status)
    if status >= 5
      'text-danger'
    elsif status >= 3 && status < 5
      'text-warning'
    else
      'text-success'
    end
  end

end
