class CreateFollowerFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :follower_followings do |t|

      t.timestamps
    end
  end
end
