class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands, dependent: :destroy
  validates :name, {:presence => true, :length => { in: 5..25 }}
  before_save :capitalize_name

private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
