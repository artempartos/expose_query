require 'spec_helper'
require 'decent_exposure/expose'
require 'action_controller'

class DummyQuery < ExposeQuery::BaseQuery

  def apply(source_scope)
    source_scope
  end

end

class DummyController < ActionController::Base
  include ExposeQuery::ControllerDsl
  extend DecentExposure::Expose
  expose(:bird) #{ 'Bird' }
  expose_query DummyQuery

end

describe ExposeQuery::ControllerDsl do

  describe '.expose_query' do
    subject { DummyController }

    it { should respond_to(:expose_query) }

    it { should respond_to(:query_classes) }

  end

  describe '.query_classes' do
    subject { DummyController.query_classes }

    it { is_expected.to include(DummyQuery) }

  end

  describe '' do
    let(:controller) { DummyController.new }
    let(:scope) {double(:scope)}
    before { expect_any_instance_of(DummyQuery).to receive(:apply).and_call_original }
    subject { controller.apply_filters(scope) }

    it { is_expected.to eq(scope) }



  end

end
