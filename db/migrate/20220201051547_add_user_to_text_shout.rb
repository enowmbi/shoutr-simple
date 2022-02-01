class AddUserToTextShout < ActiveRecord::Migration[7.0]
  def change
    add_reference :text_shouts, :user, null: false, foreign_key: true
  end
end
