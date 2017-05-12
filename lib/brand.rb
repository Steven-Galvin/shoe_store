class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, {:presence => true, :length => { in: 5..15 }}
  before_save :capitalize_name

  def currency_converter(input)
    cost = sprintf('%.2f', input)
    result = "$" + cost
    return result
  end

private

  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
