class House < ApplicationRecord
has_many :stations, dependent: :destroy
accepts_nested_attributes_for :stations,reject_if: :all_blank
# 該当フォームがすべて空の場合に無視してくれる。


# validates

validates :address, presence: true
  validates :age, presence: true
  validates :note, presence: true
  validates :house_name, presence: true
  validates :price, presence: true
end
