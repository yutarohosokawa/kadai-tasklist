class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: false
    reversible do |dir|
      dir.up do
        user = User.first
        Task.all.each do |task|
          task.update(user_id: user.id)
        end
      end
    end
    add_foreign_key :tasks, :users
  end
end