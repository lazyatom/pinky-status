class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :source, default: 'twine'
      t.string :status
      t.timestamps
    end

    Event.create!(created_at: Time.parse("11 Aug 2013 17:42:04 +0000"), source: "initial", status: "in")
    Event.create!(created_at: Time.parse("11 Aug 2013 20:25:10 +0000"), source: "twine", status: 'out')
    Event.create!(created_at: Time.parse("11 Aug 2013 21:03:03 +0000"), source: "twine", status: 'in')
    Event.create!(created_at: Time.parse("12 Aug 2013 00:53:53 +0000"), source: "twine", status: 'out')
    Event.create!(created_at: Time.parse("12 Aug 2013 01:37:01 +0000"), source: "twine", status: "in")
    Event.create!(created_at: Time.parse("12 Aug 2013 01:37:44 +0000"), source: "twine", status: "out")
    Event.create!(created_at: Time.parse("12 Aug 2013 02:12:57 +0000"), source: "twine", status: "in")
    Event.create!(created_at: Time.parse("12 Aug 2013 02:31:31 +0000"), source: "twine", status: "out")
    Event.create!(created_at: Time.parse("12 Aug 2013 03:32:33 +0000"), source: "twine", status: "in")
  end
end
