class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :bill_id
      t.string :bill_type
      t.string :chamber
      t.integer :congress
      t.json :history
      t.date :introduced
      t.date :last_action
      t.date :last_vote
      t.json :last_version
      t.string :official_title
      t.string :popular_title
      t.string :short_title
      t.json :sponsor
      t.string :sponsor_bio_id

      t.timestamps
    end
  end
end
