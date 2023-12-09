# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  def follow
    recipient = User.find(params[:user_id])
    current_user.sent_friend_requests.create(recipient: recipient)
    redirect_to user_path(recipient), notice: 'Friend request sent!'
  end

  def unfollow
    friend_request = current_user.sent_friend_requests.find_by(recipient_id: params[:user_id])
    friend_request.destroy if friend_request
    redirect_to user_path(params[:user_id]), notice: 'Unfollowed successfully.'
  end
end
