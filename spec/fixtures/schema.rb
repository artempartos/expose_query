ActiveRecord::Schema.define do

  create_table 'birds', force: true do |t|
    t.string 'name'
    t.string 'beak'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

end