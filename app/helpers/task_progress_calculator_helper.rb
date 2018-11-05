module TaskProgressCalculatorHelper
  def calculate_task_progress(_checklists)
    completed_tasks = 0
    length = 0

    _checklists.each do |checklist|
      checklist.tasks.each do |task|
        completed_tasks += task.company_tasks.where(approved: true, company: @company).count
        length += 1
      end
    end
    if completed_tasks >= 0
      number_with_precision(completed_tasks.to_f / length.to_f * 100, precision: 0)
    else
      0
    end
  end

end
