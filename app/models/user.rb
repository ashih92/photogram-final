# == Schema Information
#
# Table name: users
#
#  id                            :integer          not null, primary key
#  comments_count                :integer
#  comments_count_devise         :integer
#  email                         :string
#  email_devise                  :string           default(""), not null
#  encrypted_password            :string
#  encrypted_passworddevise      :string           default(""), not null
#  likes_count                   :integer
#  likescount_devise             :integer
#  photo                         :string
#  private                       :boolean
#  private_devise                :boolean
#  remember_created_at           :datetime
#  remember_created_at_devise    :datetime
#  reset_password_sent_at        :datetime
#  reset_password_sent_at_devise :datetime
#  reset_password_token          :string
#  reset_password_token_devise   :string
#  username                      :string
#  username_devise               :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id'
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'recipient_id'
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
end
