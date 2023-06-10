class House < ApplicationRecord
has_many :stations, dependent: :destroy
accepts_nested_attributes_for :stations,reject_if: :all_blank
# 該当フォームがすべて空の場合に無視してくれる。


# validates
end
