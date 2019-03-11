module StatesHelper
  def only_us_and_canada
    Carmen::Country.all.select { |c| %w(US CA).include?(c.code) }
  end

  def states_map(countries)
    regions = {}
    countries.each do |country|
      country.subregions.select { |subregion| regions[subregion.name] = subregion.code }
    end
    regions
  end
end
