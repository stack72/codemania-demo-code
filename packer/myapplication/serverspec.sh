#!/bin/bash
sudo gem install bundler --no-ri --no-rdoc
sudo gem install io-console --no-ri --no-rdoc
cd /tmp/tests
bundle install --path gems
bundle exec rake spec
