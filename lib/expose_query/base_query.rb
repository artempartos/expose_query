require 'active_support/core_ext/module/delegation'
class ExposeQuery::BaseQuery
  attr_reader :controller

  delegate :params, to: :controller

  def initialize(controller)
    @controller = controller
  end

  def apply(source_scope)
    source_scope
  end

end
