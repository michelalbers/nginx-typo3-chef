# Nginx Config
template "#{node['nginx']['dir']}/sites-available/typo3" do
  source 'typo3.erb'
  owner 'root'
  group node['root_group']
  mode '0644'
  action :create
  notifies :reload, 'service[nginx]'
end

# Enable Typo3
nginx_site 'typo3' do
  enable true
end

# Disable default page
nginx_site 'default' do
  enable false
end
