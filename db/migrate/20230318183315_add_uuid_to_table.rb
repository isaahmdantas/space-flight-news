class AddUuidToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :launches, :_id, :string
    add_column :events, :_id, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
