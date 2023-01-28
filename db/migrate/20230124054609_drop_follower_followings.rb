class DropFollowerFollowings < ActiveRecord::Migration[7.0]
  def up
    drop_table :follower_followings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
