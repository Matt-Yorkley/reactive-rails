module ApplicationHelper
  include Pagy::Frontend

  def display_price(price)
    "$#{number_with_precision(price, precision: 2)}"
  end

  def field_errors(object, field)
    if object.errors.any?
      if !object.errors.messages[field].blank?
        render partial: 'shared/inline_errors', locals: { object: object, field: field }
      end
    end
  end
end
