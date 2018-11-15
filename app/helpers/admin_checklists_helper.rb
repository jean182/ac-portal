module AdminChecklistsHelper
  def get_checklists(phase_number, checklists)
    checklists_phase = []
    checklists.each do |c|
      checklists_phase << c if c.phase.phase_number == phase_number
    end
    checklists_phase
  end
end
