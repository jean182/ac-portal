module MilestoneProgressCalculatorHelper
  def calculate_progress(milestones)
    completed_milestones = 0

    milestones.each do |milestone|
      completed_milestones += 1 if milestone.complete
    end
    if completed_milestones == 0
      number_with_precision(completed_milestones.to_f / milestones.length.to_f * 100, precision: 0)
    else
      0
    end
  end

end
