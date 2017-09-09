server {
    listen 80;
    server_name {{app_host}};

    # Tell Nginx and Passenger where your app's 'public' directory is
    root {{app_dir}}/public;

    # Turn on Passenger
    passenger_enabled on;
    passenger_ruby {{rubies_location}}/ruby-{{ruby_version}}/bin/ruby;

    passenger_env_var SECRET_KEY_BASE {{app_secret_key_base}};
    passenger_env_var RAILS_MASTER_KEY {{app_secrets_key}};

}
