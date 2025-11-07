class Match < ApplicationRecord
  store :result, accessors: [:winner, :loser]
   has_and_belongs_to_many :players
end
