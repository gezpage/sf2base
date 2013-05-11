class app::toolsextra {
    package {["php-pear",
              "php5-curl",
              "php5-gd",
              "php5-intl",
              "php5-mcrypt",
              "php5-sqlite",
              "git-core",
              "libpcre3-dev",
              "acl",
              "curl",
              "augeas-tools",
              "postfix"]:
        ensure => present,
    }

    exec {"set-apache-permissions":
        require => Package["acl"],
        command => "/bin/bash -c 'cd /srv/www/vhosts/$vhost.dev && setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs && setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs'",
    }

    augeas { 'set-php-ini-values':
        context => '/etc/php5/apache2/php.ini',
        changes => [
           'set Date/date.timezone Europe/London',
           'set short_open_tag Off',
        ],
        require => Package['php5'],
        notify  => Service['apache2'],
    }

}
