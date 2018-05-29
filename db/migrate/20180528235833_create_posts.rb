class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :postsss do |t|
      t.string :name
      t.string :content

    end
  end
end
