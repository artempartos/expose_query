require 'spec_helper'
require 'expose_query'

describe ExposeQuery::ActiveRecordQueryStrategy do

  let(:inflector) do
    double("Inflector", parameter: 'model_id', plural?: plural, plural: 'models', singular: 'model')
  end
  let(:model) { double('Model', new: nil) }
  let(:params) { Hash.new }
  let(:request) { double('request', post?: false, put?: false, patch?: false) }
  let(:config) { double('config', options: {}) }
  let(:controller_class) do
    double('controller_class', _decent_configurations: Hash.new(config))
  end
  let(:controller) { double('controller', params: params, request: request, class: controller_class) }

  let(:strategy) { DecentExposure::ActiveRecordStrategy.new(controller, inflector) }

  before do
    strategy.model = model
    strategy.inflector = inflector
  end

  describe '#resource' do
    let(:plural) { true }
    let(:scoped) { double('Scoped') }
    subject { strategy.resource }

    context 'with ActiveRecord 3' do
      before do
        stub_const('ActiveRecord::VERSION::MAJOR', 3)
      end
      it 'returns the scoped collection' do
        expect(model).to receive(:scoped).and_return(scoped)
        expect(controller).to receive(:apply_filters).and_return(scoped)
        expect(subject).to eq(scoped)
      end
    end

    context 'with ActiveRecord 4' do
      before do
        stub_const('ActiveRecord::VERSION::MAJOR', 4)
      end
      it 'returns the scoped collection' do
        expect(model).to receive(:all).and_return(scoped)
         expect(controller).to receive(:apply_filters).and_return(scoped)
        expect(subject).to eq(scoped)
      end
    end
  end
end
