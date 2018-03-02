class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:store_name, {:presence => true, :length => {maximum: 100}})
  before_save(:normalize)
  private

  def normalize
    self.store_name = store_name.downcase.titleize
  end

end
