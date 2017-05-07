## gitlab-installer

Easy Gitlab installer, targeting Ubuntu 16.04 LTS, on Vagrant or on metal.

Supported Vagrant providers:
 * Virtualbox

Requires Vagrant >= 1.8.0.

## Usage

Copy `gitlab.rb.example` to `gitlab.rb` and modify it with your preferences.
For complete template, please see https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/files/gitlab-config-template/gitlab.rb.template

In VM, Gitlab is available at https://192.168.98.100/
In server install, Gitlab is available at https://192.168.98.100/


## Configuration

You can configure the VM running Gitlab by exporting environment variables on host side before issuing `vagrant up`:
 * `CFG_CPU` = how many CPUs will be given to the VM (default `2`)
 * `CFG_MEMSIZE` = how much memory (in MB) will be used (default `2048`)
 * `CFG_PORT` = which port on the host Gitlab responds to (default `443`)
 * `CFG_SWAP` = if you want a swap file within VM (low memory host), in G (default `0`)
 * `CFG_HOST` = set hostname (default is `gitlab`)
 * `CFG_IP_HOSTS` = set hosts (default is 127.0.0.1 localhost localhost.local\n 192.168.98.100  gitlab gitlab\n)
 
 $ vagrant up
```


