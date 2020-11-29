# frozen_string_literal: true

class SubscriptionReflex < ApplicationReflex
  def validate
    @subscription = Subscription.where(id: params[:id]).first_or_initialize
    @subscription.assign_attributes(subscription_params)
    @subscription.valid?
  end

  private

  def subscription_params
    params.require(:subscription).permit(:tier, :price, :user_id)
  end
end
