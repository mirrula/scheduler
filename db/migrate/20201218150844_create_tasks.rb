# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :author, null: false, index: true
      t.references :list, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.datetime :expiring_date
      t.boolean :status, null: false, default: false
      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :author_id
  end
end
