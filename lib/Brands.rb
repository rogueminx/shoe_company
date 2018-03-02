class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  private

  def normalize

  end
end
