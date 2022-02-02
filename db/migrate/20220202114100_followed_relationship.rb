class FollowedRelationship < ActiveRecord::Migration[7.0]
  def change
    create_table :followed_relationships do |t|
      t.integer :follower_id
      t.integer :followed_user_id
    end

    add_index :followed_relationships, :follower_id
    add_index :followed_relationships, :followed_user_id
    add_index :followed_relationships, [:follower_id, :followed_user_id], name: "follow_indexes", unique: true
  end
end
