# Install Server

[![Ansible Lint](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml)
[![Ansible Molecule Test](https://github.com/MVladislav/ansible-install-server/actions/workflows/ci.yml/badge.svg)](https://github.com/MVladislav/ansible-install-server/actions/workflows/ci.yml)

- [Install Server](#install-server)
  - [Role Variables](#role-variables)
  - [Example Playbook](#example-playbook)
  - [License](#license)

---

Tested with:

- Ubuntu 22.04
- Ubuntu 23.04

## Role Variables

some of bellow installation option includes more packages which will installed:

- **apt_base** includes:
  - curl
  - rsync
  - git
  - vim
  - nano
  - exa
  - bat
  - duf
- **apt_auth_priv** includes:
  - dirmngr
  - gnupg
  - libpam-u2f
  - libfido2-dev
- **apt_cert** includes:
  - openssl
  - ca-certificates
  - apt-transport-https
- **apt_archive** includes:
  - rar
  - unrar
  - zip
  - p7zip-full
  - xz-utils
  - pigz
- **apt_dev** includes:
  - jq
  - iftop
  - htop
  - iotop
  - nvtop
  - powertop
  - sysstat
  - sysbench
  - smem
  - iozone3
  - haveged
  - ethtool
  - net-tools
  - iperf3
  - stress
  - stress-ng
- **apt_build** includes:
  - freeglut3-dev
  - cmake
  - g++
  - build-essential
  - autoconf
  - pkg-config
  - mesa-utils
- **apt_libs** includes:
  - libstdc++6
  - libgl1-mesa-dev
  - libegl1-mesa-dev
  - libgles2-mesa
  - libgles2-mesa-dev
  - libnet1-dev
  - libnet1
  - libpcap0.8-dev
  - libpcap0.8
  - libpcap-dev
  - libssl-dev
  - zlib1g-dev
  - libxml2-dev
  - libxslt1-dev
  - libffi-dev
  - libpq-dev
  - libgirepository1.0-dev
  - libgpgme-dev
  - libboost-dev
- **apt_php** includes:
  - php
  - php-gmp
  - php-curl
  - php-intl
  - php-mbstring
  - php-xmlrpc
  - php-mysql
  - php-gd
  - php-xml
  - php-zip

```yml
clients:
  - name: "{{ ansible_user }}"
    dev: true # will used for install (git|zsh|tmux|python|npm) per user
    updateOrCreate: false # if the user should be updated with below values
    # shell: /bin/bash # optional, else will auto selected depends on installed shells
    # group: 'adm, cdrom, sudo' # optional
    # createhome: true # optional
    # password: # optional
install_server_service_name: "{{ service_name }}"
install_server_git_user: "{{ ansible_user }}"
install_server_git_email: "{{ ansible_user }}"

# some version manually needs to checked and updated
install_server_links_to_check_update:
  mongodb_pgp: https://pgp.mongodb.com/server-7.0.asc
  mongodb_distribution: jammy/mongodb-org/7.0
  # https://snapcraft.io/node
  snap_node_version: 20
  java_version: 17

install_server_config:
  env_tun_setup: false
  # APT (1) -------------------------------
  apt_base: false
  apt_auth_priv: false
  apt_cert: false
  apt_archive: false
  apt_dev: false
  apt_build: false
  apt_libs: false
  # APT (2) -------------------------------
  apt_snap: false
  apt_vpn_resolvconf: false
  apt_vpn_wireguard: false
  apt_vpn_openvpn: false
  apt_vpn_openconnect: false
  apt_php: false
  apt_rasp_pi_pkg: false
  apt_qemu_guest_agent: false
  # DPKG ----------------------------------
  # dpkg_...: false
  # SNAP ----------------------------------
  snap_juju: false
  snap_maas: false
  snap_microk8s: false
  snap_kubectl: false
  snap_helm: false
  snap_multipass: false
  snap_btop: false
  snap_glow: false
  snap_go: false
  snap_node: false
  snap_ruby: false
  snap_openjdk: false
  snap_openjfx: false
  # OTHER --------------------------------
  apt_git_conf: false
  apt_zsh_conf: false
  git_tmux_conf: false
  # PYTHON --------------------------------
  python_pip_update: false # if pip should update all installed pkg's
  apt_python: false
  apt_python_pip: false
  apt_python_venv: false
  apt_python_dev: false
  pip_s_tui: false
  pip_virtualenv: false
  pip_autopep8: false
  pip_black: false
  pip_mypy: false
  pip_pre_commit: false
  pip_openconnect_sso: false
  pip_ansible: false
  # NPM --------------------------------
  npm_typescript: false
  # GO --------------------------------
  go_kompose: false
  go_act: false
  # OTHER --------------------------------
  mongodb: false
  apt_java_jre_headless: false
  apt_java_jdk: false
  apt_java_ant: false
```

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: servers
  roles:
    - role: install_server
      clients:
        - name: "{{ ansible_user }}"
          dev: true
          updateOrCreate: false
      install_server_service_name: "{{ service_name }}"
      install_server_git_user: "{{ ansible_user }}"
      install_server_git_email: "{{ ansible_user }}"
      install_server_config: [] # see example list above
```

## License

MIT
