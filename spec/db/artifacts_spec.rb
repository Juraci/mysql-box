require 'spec_helper'

describe file('/etc/mysql/conf.d/allow_external.cnf') do
  it { should exist }
  it { should be_file }
end

describe file('/home/vagrant/schema.sql') do
  it { should exist }
  it { should be_file }
end
