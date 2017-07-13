module ApplicationHelper
  def locale
    link_text = t('extras.en_version')
    switch_locale = :en

    if I18n.locale == :en
      link_text = t('extras.es_version')
      switch_locale = :es
    end

    link = link_to link_text, root_path(locale: switch_locale)

    link.html_safe
  end

  def social_links(url, icon)
    link_to url, target: '_blank' do
      fa_icon icon, class: 'fa-2x'
    end
  end
end
