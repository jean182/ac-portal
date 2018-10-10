# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  role                   :string
#  phone                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#  type                   :string
#

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable, :trackable

  def admin?
    self.is_a?(Admin)
  end

  def mentor?
    self.is_a?(Mentor)
  end

  def client?
    self.is_a?(Client)
  end

  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  def active_for_authentication?
    super && !deleted_at
  end

  def inactive_message
    !deleted_at ? super : :deleted_account
  end
end
