class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)

  private

  def normalize

  end
end
