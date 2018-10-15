module PageContent

  extend ActiveSupport::Concern

  included do
    before_action :set_content
  end

  def set_content
    # @page_title = "Polar Clock Shop"
    @page_title = "Exercise 6.14 : ActiveJob"
    @seo_keywords = "AZ-JEM"
    @table_pagination = 10
    @product_pagination = 6
    @comment_pagination = 3

    # binding.pry
    if (current_user)
      @user_tag = current_user.email
    else
      @user_tag = "Guest"
    end

  end

end
