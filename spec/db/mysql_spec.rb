require 'spec_helper'

describe command('mysql -u root -e "SHOW DATABASES"') do
  its(:stdout) { should contain('sandbox') }
end

describe 'check mysql remote user setup' do
  describe command('mysql -u root -e "SELECT user FROM mysql.user"') do
    its(:stdout) { should contain('dashboard')  }
  end

  describe command('mysql -u root -e "SELECT host FROM mysql.user WHERE user=\'dashboard\'"') do
    its(:stdout) { should match /\%/ }
  end
end
