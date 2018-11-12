module TaskProgressCalculatorHelper
  def calculate_task_progress(phase)
    return 100 if phase.status == :completed
    return 0 if phase.status == :inactive

    completed_tasks = 0
    length = 0

    phase.checklists.each do |checklist|
      checklist.tasks.each do |task|
        completed_tasks += task.company_tasks.where(approved: true, company: @company).count
        length += 1
      end
    end

    if completed_tasks > 0
      number_with_precision(completed_tasks.to_f / length.to_f * 100, precision: 0)
    else
      0
    end
  end

end
