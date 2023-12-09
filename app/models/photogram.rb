# == Schema Information
#
# Table name: photograms
#
#  id             :integer          not null, primary key
#  comment        :text
#  follow_request :string
#  like           :integer
#  photo          :string
#  user           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Photogram < ApplicationRecord
end
