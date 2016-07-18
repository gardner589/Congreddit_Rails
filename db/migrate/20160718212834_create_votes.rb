class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :vote_type
      t.string :chamber
      t.string :congress
      t.date :voted_at
      t.string :bill_id
      t.string :roll_id
      t.integer :year
      t.string :result

      t.timestamps
    end
  end
end
