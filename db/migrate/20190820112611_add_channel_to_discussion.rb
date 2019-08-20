class AddChannelToDiscussion < ActiveRecord::Migration[5.2]
  def change
    add_reference :discussions, :channel, foreign_key: true
  end
end
