class RestaurantPage
  include Capybara::DSL

  def menu
    all(".menu-item-info-box")
  end

  def details
    find("#detail")
  end
end
