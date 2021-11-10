class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      # t.string :title
      t.text :body
      # t.boolean :is_complete
      # t.datetime :creation_date
      # t.datetime :deadline

      t.timestamps
    end
  end
end
