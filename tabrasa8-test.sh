#!/bin/bash

# Executes the test scans and other tests

docker-compose exec php7.3 /bin/sh -c "cd /var/www/html/docroot; ../bin/drush en admin_toolbar admin_toolbar_tools admin_toolbar_links_access_filter -y"
docker-compose exec php7.3 /bin/sh -c "cd /var/www/html/docroot; ../bin/drupal-check modules/contrib/admin_toolbar"
docker-compose exec php7.3 /bin/sh -c "cd /var/www/html/docroot; ../bin/drush pm-uninstall admin_toolbar_links_access_filter admin_toolbar_tools admin_toolbar -y"
