require 'spec_helper'

describe Authorization do
  it { is_expected.to belong_to :user }
end
