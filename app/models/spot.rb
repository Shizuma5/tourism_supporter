class Spot < ApplicationRecord
  has_many :advices
  has_many :mylists
  belongs_to :create_user, class_name: "User"
  mount_uploader :picture, PictureUploader
  validates :place_name, presence: true,
            uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :picture, presence: true
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['place_name LIKE(?)', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end

  def mylist_user(user_id)
    mylists.find_by(user_id: user_id)
  end
end
