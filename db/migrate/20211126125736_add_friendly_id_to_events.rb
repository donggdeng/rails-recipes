class AddFriendlyIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :friendly_id, :string
    add_index :events, :friendly_id, unique: true

    Event.find_each do |e|
      e.update friendly_id: SecureRandom.uuid
    end
  end
end
