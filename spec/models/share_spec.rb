require 'spec_helper'

describe Share do
  it { is_expected.to belong_to(:from).class_name('User') }
  it { is_expected.to belong_to(:to).class_name('User') }
  it { is_expected.not_to allow_value('asdasdsf').for(:to_email) }
  it { is_expected.to allow_value('some.test@example.com').for(:to_email) }
end
