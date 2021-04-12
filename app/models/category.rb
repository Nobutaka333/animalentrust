class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '犬・猫' },
    { id: 2, name: '哺乳類（犬・猫以外）' },
    { id: 3, name: '鳥類(インコ・フクロウ)' },
    { id: 4, name: '魚類(熱帯魚・観賞魚)' },
    { id: 5, name: '爬虫類(ヘビ・トカゲなど)' },
    { id: 6, name: '両生類(カエルなど)' },
    { id: 7, name: 'その他（昆虫など上記に当てはまらないもの）' }
  ]
  include ActiveHash::Associations
  has_many :animals
end