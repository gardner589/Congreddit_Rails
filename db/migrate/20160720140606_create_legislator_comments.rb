class CreateLegislatorComments < ActiveRecord::Migration[5.0]
  def change
    create_table :legislator_comments do |t|
      t.string :author
      t.text :content

      t.timestamps
    end
  end
end
