class CreateLegislators < ActiveRecord::Migration[5.0]
  def change
    create_table :legislators do |t|
      t.string :name
      t.string :party
      t.integer :year_elected
      t.string :bio_id
      t.integer :number
      t.timestamps
    end
  end
end
