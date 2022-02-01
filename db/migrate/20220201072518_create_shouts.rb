class CreateShouts < ActiveRecord::Migration[7.0]
  def change
    create_table :shouts do |t|
      t.references :user
      t.references :shoutable, polymorphic: true

      t.timestamps
    end
  end
end
