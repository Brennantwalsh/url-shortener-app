class RemoveVisitNumberFromVisits < ActiveRecord::Migration[5.0]
  def change
    remove_column :visits, :visit_number, :integer
  end
end
