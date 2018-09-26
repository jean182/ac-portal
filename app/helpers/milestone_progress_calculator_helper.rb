module MilestoneProgressCalculatorHelper
  def calculate_progress(milestones)
    completed_milestones = 0

    milestones.each do |milestone|

      if milestone.complete
        completed_milestones += 1
      end
    end
    number_with_precision(completed_milestones.to_f / milestones.length.to_f * 100, precision: 0)
  end

end
