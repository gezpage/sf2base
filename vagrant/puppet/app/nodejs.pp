class app::nodejs {
    package {["nodejs",
              "npm"]:
        ensure => present,
    }

    exec { "install_node_less":
        command => "npm install --global less",
        path    => "/usr/local/bin/:/bin/:/usr/bin/",
        require => Package['npm']
    }
}
