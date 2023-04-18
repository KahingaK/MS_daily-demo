class NotificationJob < ApplicationJob
  queue_as :default

  def perform
    subscriptions = Subscription.where(active: true).includes(:category, :user)

    subscriptions.each do |subscription|
      category = subscription.category
      user = subscription.user

      new_content = category.article.where("created_at > ?", user.last_notification_time(category)).count

      if new_content > 0
        NotificationMailer.new_content(user, category, new_content).deliver_now
        user.update_last_notification_time(category)
      end
    end
  end
end
