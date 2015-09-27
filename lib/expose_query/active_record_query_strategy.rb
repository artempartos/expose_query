module ExposeQuery
  module ActiveRecordQueryStrategy

    def filtered_resource
      plural? ? controller.apply_filters(original_resource, name) : original_resource
    end

  end
end
