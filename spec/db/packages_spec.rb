require 'spec_helper'

describe package('mysql-server') do
  it { should be_installed }
end
