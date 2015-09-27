class DummyQuery < ExposeQuery::BaseQuery

  def apply(source_scope)
    source_scope
  end

end

