module SubscriptionsHelper
  def subscription_star_icon(subscription)
    case subscription.tier
    when 'Basic'
      'fa-star-o'
    when 'Standard'
      'fa-star-half-o'
    when 'Premium'
      'fa-star'
    end
  end

  def subscription_features(subscription)
    case subscription.tier
    when 'Basic'
      ['Free seminars', 'Basic resources', 'Announcements']
    when 'Standard'
      ['Seminars', 'Full courses', 'All resources']
    when 'Premium'
      ['Premium seminars', 'Extra resources', 'Profile additions']
    end
  end
end
