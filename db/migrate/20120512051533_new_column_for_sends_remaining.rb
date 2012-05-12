class NewColumnForSendsRemaining < ActiveRecord::Migration
  def up
  	add_column :users, :postsremaining, :integer
  end

  def down
  end
end
