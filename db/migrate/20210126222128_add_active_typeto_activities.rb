class AddActiveTypetoActivities < ActiveRecord::Migration[6.1]
  def change
      add_column :activities, :activity_type, :string
  end
end
