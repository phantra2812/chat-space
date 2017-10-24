class Group < ApplicationRecord
	has_many :users, through: :group_users
	has_many :group_users
	has_many :messages
    validates :name, presence: true

def last_messages
  if self.messages.last.blank?
    "まだメッセージはありません"
  else
    if self.messages.last.body.blank?
      "画像が登録されました"
    else
     self.messages.last.body
    end
  end
end

end
