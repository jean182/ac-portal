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
end
