require 'active_support/concern'
module ExposeQuery
  module ControllerDsl
    extend ActiveSupport::Concern

    included do

      class_attribute :query_objects

      def self.expose_query(*attrs)
        self.query_objects ||= []
        options = attrs.extract_options!
        filter_classes = attrs.map do |class_filter|
          OpenStruct.new(query_class: class_filter,
                         only: Array.wrap(options[:only]).compact,
                         except: Array.wrap(options[:except]).compact)
        end
        self.query_objects += Array.wrap(filter_classes)
      end

      def self.query_classes
        self.query_objects.map(&:query_class)
      end

    end

    def apply_filters(source_scope, expose_name = nil)
      query_objects ? apply_objects_for(source_scope, expose_name) : source_scope
    end

    private

    def apply_objects_for(source_scope, expose_name)
      query_objects.reduce(source_scope) do |scope, filter_object|
        if filter_object_allowed_for?(filter_object, expose_name.to_sym)
          filter_object.query_class.new(self).apply(scope)
        else
          scope
        end
      end
    end

    def filter_object_allowed_for?(object, expose_name)
      if object.only.blank?
        !object.except.include?(expose_name)
      else
        object.only.include?(expose_name)
      end
    end
  end
end
