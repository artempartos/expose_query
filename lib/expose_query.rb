require 'expose_query/version'
require 'expose_query/base_query'
require 'expose_query/controller_dsl'
require 'expose_query/active_record_query_strategy'
require 'decent_exposure'

ActiveSupport.on_load(:action_controller) do
  include ExposeQuery::ControllerDsl
end

DecentExposure::ActiveRecordStrategy.class_eval do
  include ExposeQuery::ActiveRecordQueryStrategy

  alias_method :original_resource, :resource

  def resource
    filtered_resource
  end
end
