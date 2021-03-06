# -*- encoding: utf-8 -*-
name 'elk'
maintainer 'DennyZhang'
maintainer_email 'denny.zhang001@gmail.com'
license 'All rights reserved'
description 'setup elk: logstash, elasticsearch and kibana'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.2'

supports 'ubuntu', '>= 14.04'

#depends 'apt', '=2.6.1'
depends 'apt', '=2.8.1'
#depends 'java', '=1.31.0'
depends 'java', '=1.35.0'
#depends 'chef-sugar', '~> 2.4'
depends 'chef-sugar', '~> 3.1.1'
depends 'line', '~> 0.5'
depends 'ark', '~> 0.9'
depends 'elasticsearch', '~> 0.3.10'

depends 'logstash', '=0.11.4'
