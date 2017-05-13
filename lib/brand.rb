class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, {:presence => true, :uniqueness => true, :length => { in: 5..100 }}
  validates :raw_price, {:presence => true}
  before_save :capitalize_name
  before_save :currency_converter


private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end

  def currency_converter
    self.final_price = '$' + ('%.2f' % self.raw_price)
  end
end
