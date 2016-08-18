class AddStudentAttitudeToGuestUsersAndFinProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_column :guest_users, :student_attitude, :string
  	add_column :fin_profiles, :student_attitude, :string
  end
end
