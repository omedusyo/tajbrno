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
end

