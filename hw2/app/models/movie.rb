class Movie < ActiveRecord::Base
  RATINGS = %w[G PG PG-13 R]

  def self.filter_by_rating(ratings)
    where(arel_table[:rating].in(ratings))
  end
end
