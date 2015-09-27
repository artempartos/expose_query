require 'spec_helper'
require 'expose_query'


describe ExposeQuery::ControllerDsl do

  describe '.expose_query' do
    subject { Controllers::WithOnlyParameterController }

    it { should respond_to(:expose_query) }

    it { should respond_to(:query_classes) }

  end

  describe '.query_classes' do
    subject { Controllers::WithOnlyParameterController.query_classes }

    it { is_expected.to include(DummyQuery) }

    it { is_expected.to include(NewDummyQuery) }

  end

  describe 'applying queries' do
    before do
      allow(controller).to receive(:request) do
        double('request', post?: false, put?: false, patch?: false)
      end

    end

    context 'when expose_query pass only parameter' do
      let(:controller) { Controllers::WithOnlyParameterController.new }

      it 'apply filters only one expose' do
        expect_any_instance_of(DummyQuery).to receive(:apply)
        expect_any_instance_of(NewDummyQuery).not_to receive(:apply)
        controller.birds
      end

      it 'apply filter for only expose' do
        expect_any_instance_of(DummyQuery).to receive(:apply)
        expect_any_instance_of(NewDummyQuery).to receive(:apply)
        controller.another_birds
      end

    end

    context 'when expose_query pass except parameter' do
      let(:controller) { Controllers::WithExceptParameterController.new}

      it 'apply query for birds' do
        expect_any_instance_of(DummyQuery).to receive(:apply)
        expect_any_instance_of(NewDummyQuery).to receive(:apply)
        controller.birds
      end

      it 'apply with except for another_birds' do
        expect_any_instance_of(DummyQuery).to receive(:apply)
        expect_any_instance_of(NewDummyQuery).not_to receive(:apply)
        controller.another_birds
      end

    end

  end

end
