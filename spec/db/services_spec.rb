require 'spec_helper'

describe service('mysql') do
  it { should be_running }
end
