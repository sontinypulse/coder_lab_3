class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def self.alphabetical
    products = Product.all
    if products.blank?
      []
    elsif products.size == 1
      products
    else
      products.sort_by { |k| k[:name] }
    end
  end

  private

  def set_default_image_path
    self.image_path ||= 'http://lorempixel.com/200/200/fashion'
  end
end
