# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2

      t.references :author, references: :users, null: false, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
