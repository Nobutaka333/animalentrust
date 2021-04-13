class StorageTime < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '1日未満' },
    { id: 2, name: '1日' },
    { id: 3, name: '2~3日' },
    { id: 4, name: '4~7日' },
    { id: 5, name: '1~2週間' },
    { id: 6, name: '2週間~1ヶ月未満' },
    { id: 7, name: '1ヶ月以上' }
  ]
  include ActiveHash::Associations
  has_many :animals
end