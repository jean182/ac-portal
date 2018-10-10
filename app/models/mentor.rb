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

class Mentor < User
  has_many :time_trackings
  has_many :companies
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags
  has_one :mentor_info, dependent: :destroy

  after_create_commit :create_mentor_info

  accepts_nested_attributes_for :mentor_info

  private

  def create_mentor_data
    self.mentor_info = MentorInfo.create(is_active: true) if mentor_info.nil?
  end
end
