class Match < ApplicationRecord
  store :result, accessors: [:winner_name, :loser_name, :winner_id, :loser_id]
  has_and_belongs_to_many :players
     # belongs_to :winner, class_name: 'Player'
     # belongs_to :loser, class_name: 'Player'

  after_save :set_ranking

  def set_ranking
   	self.players.each do |player|
      # winning_matches = player.matches.map(&:winner_id).count(player.id)

      winning_matches =player.matches.group_by(&:winner_name).transform_values(&:count)
      p winning_matches
      sorted_winnes = winning_matches.sort_by { |_element, count| -count }
      current_rank = 1
      sorted_winnes.each_with_index do |(element, count), index|
  
        if index > 0 && sorted_winnes[index - 1][1] != count
          current_rank = index + 1
        end
        player.rank = current_rank
        player.save!
      end  
    end  
  end
end
