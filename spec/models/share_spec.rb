require 'spec_helper'

describe Share do
  it { is_expected.to belong_to(:from).class_name('User') }
  it { is_expected.to belong_to(:to).class_name('User') }
end
