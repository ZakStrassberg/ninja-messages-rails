class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :sender, foreign_key: true
      t.references :recipient, foreign_key: true
      t.string :content
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
