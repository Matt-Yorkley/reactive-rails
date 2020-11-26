# frozen_string_literal: true

class CourseReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com

  def bulk_update
    return flash[:alert] = 'Not updated; no courses were selected.' if params[:ids].blank?

    @courses = Course.where(id: params[:ids]).all

    if @courses.update_all(bulk_params.to_h)
      flash[:notice] = 'Courses successfully updated.'
    else
      flash[:alert] = 'An error occurred whilst updating courses.'
    end
  end

  private

  def bulk_params
    params.require(:course).permit(:status)
  end
end
