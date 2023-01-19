# 質問用のモデル
class Question < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
