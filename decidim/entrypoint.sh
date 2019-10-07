#!/bin/bash

postgres_start() {
    echo "Start postgres"
    /etc/init.d/postgresql start
}

nginx_start() {
    echo "Start nginx"
    /etc/init.d/nginx start
}

create_db() {
    test -f ~decidim/.db_created && return
    sudo -u decidim bash <<'EOF'
    source ~/.bashrc
    cd ~/L18eC
    bin/rails db:create RAILS_ENV=production
    bin/rails assets:precompile db:migrate RAILS_ENV=production
    # create a default user
    echo 'email = "admin@decidim.invalid"' > /tmp/r
    echo 'password = "changeme"' >> /tmp/r
    echo 'user = Decidim::System::Admin.new(email: email, password: password, password_confirmation: password)' >> /tmp/r
    echo 'user.save!' >> /tmp/r
    cat /tmp/r | bin/rails console -e production
    touch ~/.db_created
EOF
}

echo "Start decidim"
postgres_start
create_db
nginx_start

exec $@
