class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand_name, {:presence => true, :uniqueness => true, :length => {maximum: 100}})
  validates(:price, {:presence => true})
  before_save(:normalize)
  private

  def normalize
    self.brand_name = brand_name.downcase.titleize
    self.price = '%.2f' % self.price
  end

end
