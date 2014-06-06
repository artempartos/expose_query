module ExposeQuery
  module ActiveRecordQueryStrategy

    def filtered_resource
      plural? ? controller.apply_filters(original_resource) : original_resource
    end

  end
end
