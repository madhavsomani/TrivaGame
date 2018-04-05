class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :question
      t.string :answer
      t.integer :points
      t.integer :no_of_attempted
      t.string :submitted_by

      t.timestamps
    end
  end
end
