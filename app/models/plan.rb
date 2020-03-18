class Plan < ApplicationRecord
  has_many :sankas, dependent: :destroy
  has_many :sanka_users, through: :sankas, source: :user
  
  validates :purpose,  presence: true, length: { maximum: 50 }
  validates :meetdate,  presence: true
  validates :finish_date,  presence: true
  validates :meeting_place,  presence: true, length: { maximum: 50 }
  validates :destination,  presence: true, length: { maximum: 50 }
  
       # マイクロポストをいいねする
  def sanka(user)
    sankas.create(user_id: user.id)
  end

  # マイクロポストのいいねを解除する（ネーミングセンスに対するクレームは受け付けません）
  def unsanka(user)
    sankas.find_by(user_id: user.id).destroy
  end
  
  def sanka?(user)
    sanka_users.include?(user)
  end
end
