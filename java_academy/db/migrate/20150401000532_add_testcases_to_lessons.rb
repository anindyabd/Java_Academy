class AddTestcasesToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :testcases, :text
    add_column :lessons, :expectedresults, :text
  end
end
