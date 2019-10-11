class RestaurantListPage
  include Capybara::DSL

  def load
    visit "/restaurants"
  end

  def list
    all(".restaurant-item")
  end

  def go(restaurant)
    find(".restaurant-item", text: restaurante.upcase).click
  end

  def add_to_cart(name)
    find('.menu-item-info-box', text: name.upcase).find('.add-to-cart').click
  end
end
