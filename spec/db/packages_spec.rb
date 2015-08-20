require 'spec_helper'

shared_examples 'a required package' do |packages|
  packages.each do |package_name|
    describe package(package_name) do
      it { should be_installed }
    end
  end
end

describe 'dependencies' do
  it_behaves_like 'a required package', ['mysql-server', 'python-dev', 'libmysqlclient-dev', 'python-pip', 'build-essential']
end
