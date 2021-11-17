# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :icon
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
