# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    yr, subject, winner
  FROM
    nobels
  WHERE
    yr = 1950;
    --no chem prize means null that year.
  SQL
end
