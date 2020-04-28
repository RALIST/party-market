module ErrorsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { errors: { message: e.message } },
             status: :unprocessable_entity
    end
  end
end
