class StoragePlacePet < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '応募者宅(預かる人の家)' },
    { id: 2, name: '募集者宅(預ける人の家)' },
    { id: 3, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :animals
end