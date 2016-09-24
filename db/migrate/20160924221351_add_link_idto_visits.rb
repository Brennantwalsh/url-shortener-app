class AddLinkIdtoVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :link_id, :integer
  end
end
