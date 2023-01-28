class AddFollowersAndFollowedToFolowerFollowings < ActiveRecord::Migration[7.0]
  def change
    change_table(:follower_followings) do |t|
      t.references :followed, foreign_key: { to_table: 'users' }
      t.references :follower, foreign_key: { to_table: 'users' }
    end
  end
end
