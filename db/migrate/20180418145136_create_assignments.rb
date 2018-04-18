class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.boolean :status
      t.attachment :submission
      t.date :proposed_date
      t.date :deadline
      t.string :grade
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
