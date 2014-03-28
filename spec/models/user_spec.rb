require 'spec_helper'

describe User do
  it { is_expected.to have_many :authorizations }
  it { is_expected.to have_many :shares }
end
