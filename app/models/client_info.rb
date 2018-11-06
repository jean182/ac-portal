# == Schema Information
#
# Table name: client_infos
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint(8)
#  client_id   :integer
#

class ClientInfo < ApplicationRecord
  belongs_to :client, dependent: :destroy
  belongs_to :company
end
