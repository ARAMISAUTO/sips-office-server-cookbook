default['sips-office-server']['password'] = ''
default['sips-office-server']['user'] = 'sips'
default['sips-office-server']['group'] = 'sips'
default['sips-office-server']['install_dir_prefix'] = '/usr/local'
default['sips-office-server']['log_dir'] = '/var/log/sips-office-server'
default['sips-office-server']['service'] = {
  'port' => 7180,
  'max_requests' => 5,
  'max_queue_size' => 5,
  'acl' => { 'accept' => [], 'deny' => [] },
}
default['sips-office-server']['command'] = {
  'port' => 7181,
  'max_requests' => 5,
  'max_queue_size' => 5,
  'acl' => { 'accept' => [], 'deny' => [] },
}
default['sips-office-server']['http_request'] = {
  'port' => 7182,
  'max_requests' => 1,
  'max_queue_size' => 1,
  'acl' => { 'accept' => [], 'deny' => [] },
}
default['sips-office-server']['watchdog'] = {
  'port' => 7183,
  'polling_timer' => 6000,
  'max_queue_size' => 1,
}
default['sips-office-server']['alert'] = {
  'url' => '',
  'proxy_host' => '',
  'proxy_port' => '',
}
default['sips-office-server']['components']['checkout'] = 'composant_checkout_101.zip'
default['sips-office-server']['components']['diag'] = 'composant_diag_309.zip'
default['sips-office-server']['components']['office'] = 'composant_office_328.zip'
