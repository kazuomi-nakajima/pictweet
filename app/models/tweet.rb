class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments #commentテーブルとアソシエーション(複数形)

   # imageも空で投稿できないように追記
  validates :text, :image, presence: true
end
