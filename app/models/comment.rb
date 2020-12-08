class Comment < ApplicationRecord
  belongs_to :tweet #tweetdテーブルとアソシエーション
  belongs_to :user #usersテーブルとアソシエーション
end
