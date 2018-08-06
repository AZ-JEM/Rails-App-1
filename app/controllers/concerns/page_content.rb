module PageContent

  extend ActiveSupport::Concern

  included do
    before_action :set_content
  end

  def set_content
    @page_title = "Polar Clock Shop"
    @seo_keywords = "AZ-JEM"
  end

end
