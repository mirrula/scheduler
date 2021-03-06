# rubocop:disable Layout/LineLength

module ListsHelper
  def render_lists
    out = ''
    @lists.each do |list|
      out << "<div class=\"col-3\">
                        <a href=\"#{list_path(list.id)}\">
                            <div class=\"card w-100 h-100\">
                                <div class=\"image-setter\">
                                    <img src=\"#{list.icon}\" class=\"card-img-top\" alt=\"...\"  onerror=\"this.onerror=null;this.src='/assets/error.jpg';\">
                                </div>
                                <div class=\"card-body\">
                                    <h2><strong>#{list.name}</strong></h2>
                                    <p><strong class=\"gray\">#{list.created_at.strftime('%-d/%-m/%y - %H:%M')}</strong></p>
                                </div>
                            </div>
                        </a>
                    </div>"
    end
    out.html_safe
  end
end

# rubocop:enable Layout/LineLength
