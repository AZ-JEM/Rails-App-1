module PageContent

  extend ActiveSupport::Concern

  included do
    before_action :set_content
  end

  def set_content
    @page_title = "Polar Clock Shop"
    @seo_keywords = "AZ-JEM"
    @table_pagination = 10
    @product_pagination = 6
    @comment_pagination = 3
  end

end
