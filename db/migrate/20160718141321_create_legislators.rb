class CreateLegislators < ActiveRecord::Migration[5.0]
  def change
    create_table :legislators do |t|
      t.string :first_name
      t.string :last_name
      t.string :party
      t.integer :year_elected
      t.string :bio_id
      t.string :chamber
      t.string :state
      t.integer :district
      t.integer :number
      t.timestamps
    end
  end
end
