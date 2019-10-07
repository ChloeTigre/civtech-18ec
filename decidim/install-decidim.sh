#!/usr/bin/env bash

# target OS: debian buster, raspbian buster
# tested using a Docker buster image.


DECIDIM_PG_PASSWD=${DECIDIM_PG_PASSWD:-decidim}

# Expected order:
#create_user                                                                                              
#do_install
#install_rbenv
#config_rbenv
#install_decidim_gem
#create_decidim_app
#create_postgresql_account
#use_figaro
#do_bundle_install
#generate_application_yml
#start_tracking_changes
#dummy_test

# call whatever function is set as first parameter
source parts/$1
$@
