require 'active_support/concern'
module ExposeQuery
  module ControllerDsl
    extend ActiveSupport::Concern

    included do

      cattr_accessor :query_classes

      def self.expose_query(*filter_classes)
        self.query_classes = Array.wrap(filter_classes.to_a)
      end

    end

    def apply_filters(source_scope)
      query_classes ? query_classes.reduce(source_scope){|scope, filter| filter.new(self).apply(scope)} : source_scope
    end

  end
end
