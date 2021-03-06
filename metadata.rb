name 'sips-office-server'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures sips-office-server'
long_description 'Installs/Configures sips-office-server'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/sips-office-server/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/sips-office-server'

depends 'apt', '~> 6.1.4'
depends 'ark', '~> 1.1.0'
depends 'java', '~> 1.42.0'
depends 'poise-service', '~> 1.5.2'
