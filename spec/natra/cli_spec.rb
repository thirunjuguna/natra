# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/natra'
RSpec.describe Natra::VERSION do
  subject { Natra::Generators::AppGenerator }
  describe 'source_root' do
    it 'should return with a full path' do
      pwd           = File.dirname(__FILE__)
      template_path = pwd.sub 'spec/natra', 'lib/natra/generators/app/templates'
      expect(subject.source_root).to eq(template_path)
    end
  end
end
