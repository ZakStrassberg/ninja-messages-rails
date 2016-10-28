class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, references: :sender
      t.references :user, references: :recipient
      t.string :content
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
