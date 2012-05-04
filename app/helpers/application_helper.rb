module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        ([t("title.first_bit")] + parts).collect(&:capitalize).join(t("title.separator")) unless parts.empty?
      end
    end
  end
end
