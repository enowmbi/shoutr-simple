class RemoveUserFromTextShout < ActiveRecord::Migration[7.0]
  def change
    remove_column :text_shouts, :user_id, :integer
  end
end
