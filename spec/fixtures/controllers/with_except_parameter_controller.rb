require 'action_controller'
require 'decent_exposure/expose'

class Controllers::WithExceptParameterController < ActionController::Base
  expose(:birds)
  expose(:another_birds, model: :bird)

  expose_query DummyQuery
  expose_query NewDummyQuery, except: :another_birds

  decent_configuration do
    strategy DecentExposure::ActiveRecordStrategy
  end

  def params
    {}
  end

end