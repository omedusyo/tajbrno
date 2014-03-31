module ApplicationHelper
  def nav_items
    {
      'Home' => { controller: :articles, action: :index },
      'Menu' => {controller: :categories, action: :index },
      'Reserve a table' => { controller: :reservations, action: :new },
      'Gallery' => { controller: :gallery, action: :index },
      'Contact us' => { controller: :articles, action: :contacts },
    }
  end

  def title
    @title || 'Home'
  end

  def format_title title
    word = title.split.map do |word|
      word.capitalize
    end

    word.join ' '
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find session[:user_id]
  end

  def has_access_to? c
    logged_in? and current_user.has_access? c
  end

  def show_errors
    if flash[:errors].present?
      content_tag :div, class: [ 'twelve', 'columns' ] do
        flash[:errors].each do |error|
          concat content_tag(:div, error, class: [ 'danger', 'alert' ])
        end
      end
    end
  end

  def show_notice
    if flash[:notice].present?
      content_tag(:div) do
        concat content_tag(:div, flash[:notice], id: 'notice')
        concat javascript_include_tag(:msg_box)
      end
    end
  end
end

