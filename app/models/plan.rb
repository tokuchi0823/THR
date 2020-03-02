class Plan < ApplicationRecord
  has_many :sankas, dependent: :destroy
  has_many :sanka_users, through: :sankas, source: :user
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
