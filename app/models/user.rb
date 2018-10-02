class User < ApplicationRecord
  belongs_to :account, polymorphic: true, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def admin?
    account.is_a?(Admin)
  end

  def mentor?
    account.is_a?(Mentor)
  end

  def client?
    account.is_a?(Client)
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
