server {
    listen 80;
    server_name {{app_host}};

    # Tell Nginx and Passenger where your app's 'public' directory is
    root {{app_dir}}/public;

    # Turn on Passenger
    passenger_enabled on;
    passenger_ruby {{rubies_location}}/ruby-{{ruby_version}}/bin/ruby;
}
