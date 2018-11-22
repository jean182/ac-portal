module AdminChecklistsHelper
  def sort_by_phase(phase_number)
    @checklists.select { |ch| ch.phase_number == phase_number }
  end
end
