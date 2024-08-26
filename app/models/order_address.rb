class OrderAddress
  include ActiveModel::Model
  attr_accessor :token

  with_options presence: true do
    validates :user_id, :item_id, :token, :city, :block, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id) # rubocop:disable Style/HashSyntax
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id) # rubocop:disable Style/HashSyntax
  end
end
