class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string

    create_table :channels_users, id: false do |t|
      t.belongs_to :channel, index: true
      t.belongs_to :user, index: true
    end
  end
end
