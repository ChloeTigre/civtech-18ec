FROM debian:buster

COPY install-decidim.sh /install-decidim.sh
RUN chmod +x /install-decidim.sh && mkdir /parts
COPY parts/create_user /parts/
RUN /install-decidim.sh create_user
COPY parts/do_install /parts/
RUN /install-decidim.sh do_install
COPY parts/install_rbenv /parts/
RUN /install-decidim.sh install_rbenv
COPY parts/config_rbenv /parts/
RUN /install-decidim.sh config_rbenv
COPY parts/install_decidim_gem /parts/
RUN /install-decidim.sh install_decidim_gem
COPY parts/create_decidim_app /parts/
RUN /install-decidim.sh create_decidim_app
COPY parts/create_postgresql_account /parts/
RUN /install-decidim.sh create_postgresql_account
COPY parts/use_figaro /parts/
RUN /install-decidim.sh use_figaro
COPY parts/do_bundle_install /parts/
RUN /install-decidim.sh do_bundle_install
COPY parts/generate_application_yml /parts/
RUN /install-decidim.sh generate_application_yml
COPY parts/start_tracking_changes /parts/
RUN /install-decidim.sh start_tracking_changes
COPY parts/deploy_nginx /parts/
RUN /install-decidim.sh deploy_nginx
COPY parts/deploy_passenger /parts/
RUN /install-decidim.sh deploy_passenger
COPY parts/deploy_vhost /parts/
RUN /install-decidim.sh deploy_vhost


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
