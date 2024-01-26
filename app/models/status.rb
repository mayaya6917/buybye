class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '出品中' },
    { id: 3, name: '売却済み' },
    { id: 4, name: '出品停止中' },
  ]

  include ActiveHash::Associations
  has_many :sells
  end