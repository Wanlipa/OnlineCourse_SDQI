class CreateYoutubes < ActiveRecord::Migration[5.1]
  def change
    create_table :youtubes do |t|
      t.string :url
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
