require 'spec_helper'

shared_examples 'a required package' do |packages|
  packages.each do |package_name|
    describe package(package_name) do
      it { should be_installed }
    end
  end
end

shared_examples 'a required pip package' do |pip_packages|
  pip_packages.each do |pip_package|
    describe command("pip list | grep #{pip_package}") do
      its(:stdout) { should match /#{pip_package}/  }
    end
  end
end

describe 'dependencies' do
  it_behaves_like 'a required package', ['mysql-server', 'python-dev', 'libmysqlclient-dev', 'python-pip', 'build-essential']
  it_behaves_like 'a required pip package', ['MySQL-python']
end
