class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :source, default: 'twine'
      t.string :status
      t.timestamps
    end

    Event.create!(status: 'in', source: 'initial')
  end
end
