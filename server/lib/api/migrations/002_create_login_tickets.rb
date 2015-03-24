class CreateLoginTickets < ActiveRecord::Migration
  def change
    create_table :login_tickets do |t|
      t.string :name, null: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
