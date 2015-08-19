require 'spec_helper'

describe command('mysql -u root -e "SHOW DATABASES"') do
  its(:stdout) { should contain('sandbox') }
end
