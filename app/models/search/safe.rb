# app/models/search/Safe.rb

class Search::Safe < Search::Base
  ATTRIBUTES = %i(
    name
    maker
    to
    from
    place
  )
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Safe.arel_table
    results = ::Safe.all
    results = results.where(contains(t[:name], name)) if name.present?
    results = results.where(contains(t[:maker], maker)) if maker.present?
    results = results.where(contains(t[:to], to)) if to.present?
    results = results.where(contains(t[:from], from)) if from.present?
    results = results.where(contains(t[:place], place)) if place.present?
    results
  end
end