class UserRefactor < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :type, :string

    add_column :clients, :client_id, :integer
    add_index :clients, :client_id
    remove_foreign_key :time_trackings, column: :client_id
    rename_table :clients, :client_infos

    execute('select * from client_infos order by id asc').each do |client|
      user = User.where(account_type: 'Client', account_id: client['id']).first
      user.update_column(:type, 'Client')
      ClientInfo.find(client['id']).update_column(:client_id, user.id)
      TimeTracking.where(client_id: client['id']).find_each do |record|
        record.update_column(:client_id, user.id)
      end
    end

    add_foreign_key :time_trackings, :users, column: :client_id

    add_column :mentors, :client_id, :integer
    add_index :mentors, :client_id
    change_column :mentors, :is_active, :boolean, default: true
    remove_foreign_key :time_trackings, column: :mentor_id
    remove_foreign_key :companies, column: :mentor_id
    remove_foreign_key :has_tags, column: :mentor_id
    rename_table :mentors, :mentor_infos

    execute('select * from mentor_infos order by id asc').each do |mentor|
      user = User.where(account_type: 'Mentor', account_id: mentor['id']).first
      user.update_column(:type, 'Mentor')
      MentorInfo.find(mentor['id']).update_column(:client_id, user.id)
      TimeTracking.where(mentor_id: mentor['id']).find_each do |record|
        record.update_column(:mentor_id, user.id)
      end
      Company.where(mentor_id: mentor['id']).find_each do |record|
        record.update_column(:mentor_id, user.id)
      end
      HasTag.where(mentor_id: mentor['id']).find_each do |record|
        record.update_column(:mentor_id, user.id)
      end
    end

    add_foreign_key :time_trackings, :users, column: :mentor_id
    add_foreign_key :companies, :users, column: :mentor_id
    add_foreign_key :has_tags, :users, column: :mentor_id

    remove_foreign_key :locations, column: :admin_id

    execute('select * from mentor_infos order by id asc').each do |admin|
      user = User.where(account_type: 'Admin', account_id: admin['id']).first
      user.update_column(:type, 'Admin')
      Location.where(admin_id: admin['id']).find_each do |record|
        record.update_column(:admin_id, user.id)
      end
    end

    add_foreign_key :locations, :users, column: :admin_id

    drop_table :admins

    remove_column :users, :account_id
    remove_column :users, :account_type
    rename_column :users, :title, :role
  end

  def down
    add_column :users, :type, :string

    add_column :clients, :client_id, :integer
    add_index :clients, :client_id
    remove_foreign_key :time_trackings, column: :client_id
    rename_table :clients, :client_infos

    execute('select * from client_infos order by id asc').each do |client|
      user = User.where(account_type: 'Client', account_id: client['id']).first
      user.update_column(:type, 'Client')
      ClientInfo.find(client['id']).update_column(:client_id, user.id)
      TimeTracking.where(client_id: client['id']).find_each do |record|
        record.update_column(:client_id, user.id)
      end
    end

    add_foreign_key :time_trackings, :users, column: :client_id

    add_column :mentors, :client_id, :integer
    add_index :mentors, :client_id
    change_column :mentors, :is_active, :boolean, default: true
    remove_foreign_key :time_trackings, column: :mentor_id
    remove_foreign_key :companies, column: :mentor_id
    remove_foreign_key :has_tags, column: :mentor_id
    rename_table :mentors, :mentor_infos

    execute('select * from mentor_infos order by id asc').each do |mentor|
      user = User.where(account_type: 'Mentor', account_id: mentor['id']).first
      user.update_column(:type, 'Mentor')
      MentorInfo.find(mentor['id']).update_column(:client_id, user.id)
      TimeTracking.where(mentor_id: mentor['id']).find_each do |record|
        record.update_column(:mentor_id, user.id)
      end
      Company.where(mentor_id: mentor['id']).find_each do |record|
        record.update_column(:mentor_id, user.id)
      end
      HasTag.where(mentor_id: mentor['id']).find_each do |record|
        record.update_column(:mentor_id, user.id)
      end
    end

    add_foreign_key :time_trackings, :users, column: :mentor_id
    add_foreign_key :companies, :users, column: :mentor_id
    add_foreign_key :has_tags, :users, column: :mentor_id

    remove_foreign_key :locations, column: :admin_id

    execute('select * from mentor_infos order by id asc').each do |admin|
      user = User.where(account_type: 'Admin', account_id: admin['id']).first
      user.update_column(:type, 'Admin')
      Location.where(admin_id: admin['id']).find_each do |record|
        record.update_column(:admin_id, user.id)
      end
    end

    add_foreign_key :locations, :users, column: :admin_id

    drop_table :admins

    remove_column :users, :account_id
    remove_column :users, :account_type
    rename_column :users, :title, :role
  end
end
