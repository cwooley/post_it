class AddVotesToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :vote_count, :integer, default: 0
  end

end
