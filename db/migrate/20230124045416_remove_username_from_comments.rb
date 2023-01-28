class RemoveUsernameFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :username, :string
  end
end
