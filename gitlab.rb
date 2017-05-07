# Change the external_url to the address your users will type in their browser
# if http
# external_url 'http://gitlab.local/'

# if https
external_url 'https://gitlabcompany/'
nginx['redirect_http_to_https'] = true
nginx['ssl_certificate'] = "/etc/ssl/certs/ssl-cert-snakeoil.pem"
nginx['ssl_certificate_key'] = "/etc/ssl/private/ssl-cert-snakeoil.key"

#
# These settings are documented in more detail at
# https://gitlab.com/gitlab-org/gitlab-ce/blob/master/config/gitlab.yml.example#L118
#
gitlab_rails['ldap_enabled'] = false
gitlab_rails['ldap_servers'] = YAML.load <<-EOS
  main:
    host: 'ldap.host.here'
    port: 389
    uid: 'sAMAccountName'
    method: 'tls' # 'tls' or 'plain' or 'ssl'
    bind_dn: 'bind.user.here'
    password: 'bind.pass.here'
    active_directory: false
    allow_username_or_email_login: false
    base: 'bind.base.here'
    user_filter:
    attributes:
        username: [ 'sAMAccountName' ]
        email: [ 'mail', 'userPrincipalName' ]
        name: [ 'displayName' ]
EOS

# gitlab_rails['gitlab_ssh_host'] = 'ssh.host_example.com'
gitlab_rails['time_zone'] = 'UTC'


# might want to disable this if ldap enabled
gitlab_rails['gitlab_signup_enabled'] = true
gitlab_rails['gitlab_signin_enabled'] = true

# limit the projects
gitlab_rails['gitlab_default_can_create_group'] = true
#gitlab_rails['gitlab_username_changing_enabled'] = true
gitlab_rails['gitlab_default_projects_limit'] = 100
gitlab_rails['gitlab_default_projects_features_issues'] = true
gitlab_rails['gitlab_default_projects_features_merge_requests'] = true
gitlab_rails['gitlab_default_projects_features_wiki'] = true
gitlab_rails['gitlab_default_projects_features_snippets'] = true
gitlab_rails['gitlab_default_projects_features_builds'] = true


### Default Theme
gitlab_rails['gitlab_default_theme'] = 2

# keep backup for about 4 weeks
gitlab_rails['backup_keep_time'] = 2404800

# unicorn conf
unicorn['worker_processes'] = 2
unicorn['worker_timeout'] = 180

###############################################################################
## GitLab Logging
##! Docs: https://docs.gitlab.com/omnibus/settings/logs.html
################################################################################

logging['svlogd_size'] = 200 * 1024 * 1024 # rotate after 200 MB of log data
logging['svlogd_num'] = 30 # keep 30 rotated log files
logging['svlogd_timeout'] = 24 * 60 * 60 # rotate after 24 hours
logging['svlogd_filter'] = "gzip" # compress logs with gzip
logging['svlogd_udp'] = nil # transmit log messages via UDP
logging['svlogd_prefix'] = nil # custom prefix for log messages
# logging['logrotate_frequency'] = "daily" # rotate logs daily
# logging['logrotate_size'] = nil # do not rotate by size by default
# logging['logrotate_rotate'] = 30 # keep 30 rotated logs
logging['logrotate_compress'] = "compress" # see 'man logrotate'
# logging['logrotate_method'] = "copytruncate" # see 'man logrotate'
# logging['logrotate_postrotate'] = nil # no postrotate command by default
logging['logrotate_dateformat'] = "-%Y-%m-%d" # use date extensions for rotated files rather than numbers e.g. a value of "-%Y-%m-%d" would give rotated files like production.log-2016-03-09.gz

################################################################################
## Logrotate
##! Docs: https://docs.gitlab.com/omnibus/settings/logs.html#logrotate
##! You can disable built in logrotate feature.
################################################################################
logrotate['enable'] = true



### Build Artifacts
# gitlab_rails['artifacts_enabled'] = true
# gitlab_rails['artifacts_path'] = "/mnt/storage/artifacts"

### GitLab Shell settings for GitLab
gitlab_rails['gitlab_shell_ssh_port'] = 22
gitlab_rails['git_max_size'] = 20971520
gitlab_rails['git_timeout'] = 100





