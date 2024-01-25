# Install Server

[![Ansible Lint](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml)
[![Ansible Molecule Test](https://github.com/MVladislav/ansible-install-server/actions/workflows/ci.yml/badge.svg)](https://github.com/MVladislav/ansible-install-server/actions/workflows/ci.yml)

- [Install Server](#install-server)
  - [App list for possible install](#app-list-for-possible-install)
  - [Dependencies](#dependencies)
  - [Example Playbook](#example-playbook)
  - [License](#license)

---

You can checkout [MVladislav - ansible-env-setup - playbooks](https://github.com/MVladislav/ansible-env-setup/tree/main/playbooks) for how i use it in general.

Tested with:

- Ubuntu 22.04
- Ubuntu 23.04

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
  apt_java_jre_headless: false
  apt_java_jdk: false
  apt_java_ant: false
  apt_php: false
  # APT (2) -------------------------------
  apt_snap: false
  apt_qemu_guest_agent: false
  apt_rasp_pi_pkg: false
  # APT (3) -------------------------------
  apt_vpn_resolvconf: false
  apt_vpn_wireguard: false
  apt_vpn_openvpn: false
  apt_vpn_openconnect: false
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
```

## App list for possible install

> some of below service installations includes more packages which combined by topic

| App                    | snap | flathub | apt | pip | go  | source/conf | topic       |
| :--------------------- | :--: | :-----: | :-: | :-: | :-: | :---------: | :---------- |
| curl                   |      |         |  x  |     |     |             | base\*      |
| rsync                  |      |         |  x  |     |     |             | base\*      |
| git                    |      |         |  x  |     |     |             | base\*      |
| vim                    |      |         |  x  |     |     |             | base\*      |
| nano                   |      |         |  x  |     |     |             | base\*      |
| exa                    |      |         |  x  |     |     |             | base\*      |
| bat                    |      |         |  x  |     |     |             | base\*      |
| duf                    |      |         |  x  |     |     |             | base\*      |
| dirmngr                |      |         |  x  |     |     |             | auth_priv\* |
| gnupg                  |      |         |  x  |     |     |             | auth_priv\* |
| libpam-u2f             |      |         |  x  |     |     |             | auth_priv\* |
| libfido2-dev           |      |         |  x  |     |     |             | auth_priv\* |
| openssl                |      |         |  x  |     |     |             | cert\*      |
| ca-certificates        |      |         |  x  |     |     |             | cert\*      |
| apt-transport-https    |      |         |  x  |     |     |             | cert\*      |
| rar                    |      |         |  x  |     |     |             | archive\*   |
| unrar                  |      |         |  x  |     |     |             | archive\*   |
| zip                    |      |         |  x  |     |     |             | archive\*   |
| p7zip-full             |      |         |  x  |     |     |             | archive\*   |
| xz-utils               |      |         |  x  |     |     |             | archive\*   |
| pigz                   |      |         |  x  |     |     |             | archive\*   |
| jq                     |      |         |  x  |     |     |             | dev\*       |
| iftop                  |      |         |  x  |     |     |             | dev\*       |
| htop                   |      |         |  x  |     |     |             | dev\*       |
| iotop                  |      |         |  x  |     |     |             | dev\*       |
| nvtop                  |      |         |  x  |     |     |             | dev\*       |
| powertop               |      |         |  x  |     |     |             | dev\*       |
| sysstat                |      |         |  x  |     |     |             | dev\*       |
| sysbench               |      |         |  x  |     |     |             | dev\*       |
| smem                   |      |         |  x  |     |     |             | dev\*       |
| iozone3                |      |         |  x  |     |     |             | dev\*       |
| haveged                |      |         |  x  |     |     |             | dev\*       |
| ethtool                |      |         |  x  |     |     |             | dev\*       |
| net-tools              |      |         |  x  |     |     |             | dev\*       |
| iperf3                 |      |         |  x  |     |     |             | dev\*       |
| stress                 |      |         |  x  |     |     |             | dev\*       |
| stress-ng              |      |         |  x  |     |     |             | dev\*       |
| freeglut3-dev          |      |         |  x  |     |     |             | build\*     |
| cmake                  |      |         |  x  |     |     |             | build\*     |
| g++                    |      |         |  x  |     |     |             | build\*     |
| build-essential        |      |         |  x  |     |     |             | build\*     |
| autoconf               |      |         |  x  |     |     |             | build\*     |
| pkg-config             |      |         |  x  |     |     |             | build\*     |
| mesa-utils             |      |         |  x  |     |     |             | build\*     |
| libgl1-mesa-dev        |      |         |  x  |     |     |             | libs\*      |
| libegl1-mesa-dev       |      |         |  x  |     |     |             | libs\*      |
| libgles2-mesa          |      |         |  x  |     |     |             | libs\*      |
| libgles2-mesa-dev      |      |         |  x  |     |     |             | libs\*      |
| libnet1-dev            |      |         |  x  |     |     |             | libs\*      |
| libnet1                |      |         |  x  |     |     |             | libs\*      |
| libpcap0.8-dev         |      |         |  x  |     |     |             | libs\*      |
| libpcap0.8             |      |         |  x  |     |     |             | libs\*      |
| libpcap-dev            |      |         |  x  |     |     |             | libs\*      |
| libssl-dev             |      |         |  x  |     |     |             | libs\*      |
| zlib1g-dev             |      |         |  x  |     |     |             | libs\*      |
| libxml2-dev            |      |         |  x  |     |     |             | libs\*      |
| libxslt1-dev           |      |         |  x  |     |     |             | libs\*      |
| libffi-dev             |      |         |  x  |     |     |             | libs\*      |
| libpq-dev              |      |         |  x  |     |     |             | libs\*      |
| libgirepository1.0-dev |      |         |  x  |     |     |             | libs\*      |
| libgpgme-dev           |      |         |  x  |     |     |             | libs\*      |
| libboost-dev           |      |         |  x  |     |     |             | libs\*      |
| php                    |      |         |  x  |     |     |             | php\*       |
| php-gmp                |      |         |  x  |     |     |             | php\*       |
| php-curl               |      |         |  x  |     |     |             | php\*       |
| php-intl               |      |         |  x  |     |     |             | php\*       |
| php-mbstring           |      |         |  x  |     |     |             | php\*       |
| php-xmlrpc             |      |         |  x  |     |     |             | php\*       |
| php-mysql              |      |         |  x  |     |     |             | php\*       |
| php-gd                 |      |         |  x  |     |     |             | php\*       |
| php-xml                |      |         |  x  |     |     |             | php\*       |
| php-zip                |      |         |  x  |     |     |             | php\*       |
| jre_headless           |      |         |  x  |     |     |      x      | java        |
| jdk                    |      |         |  x  |     |     |      x      | java        |
| ant                    |      |         |  x  |     |     |             | java        |
| snap                   |      |         |  x  |     |     |             | system      |
| qemu_guest_agent       |      |         |  x  |     |     |             | system      |
| rasp_pi_pkg            |      |         |  x  |     |     |             | system      |
| resolvconf             |      |         |  x  |     |     |             | vpn         |
| wireguard              |      |         |  x  |     |     |             | vpn         |
| openvpn\*              |      |         |  x  |     |     |             | vpn         |
| openconnect            |      |         |  x  |     |     |             | vpn         |
| juju                   |  x   |         |     |     |     |             |             |
| maas                   |  x   |         |     |     |     |             |             |
| microk8s               |  x   |         |     |     |     |             |             |
| kubectl                |  x   |         |     |     |     |             |             |
| helm                   |  x   |         |     |     |     |             |             |
| multipass              |  x   |         |     |     |     |             |             |
| btop                   |  x   |         |     |     |     |             |             |
| glow                   |  x   |         |     |     |     |             |             |
| go                     |  x   |         |     |     |     |             |             |
| node                   |  x   |         |     |     |     |             |             |
| ruby                   |  x   |         |     |     |     |             |             |
| openjdk                |  x   |         |     |     |     |             |             |
| openjfx                |  x   |         |     |     |     |             |             |
| git                    |      |         |  x  |     |     |      x      |             |
| zsh                    |      |         |  x  |     |     |      x      |             |
| tmux                   |      |         |     |     |     |      x      |             |
| python\*               |      |         |  x  |     |     |             |             |
| python pip\*           |      |         |  x  |     |     |             |             |
| python venv\*          |      |         |  x  |     |     |             |             |
| python dev\*           |      |         |  x  |     |     |             |             |
| s_tui                  |      |         |     |  x  |     |             |             |
| virtualenv             |      |         |     |  x  |     |             |             |
| autopep8               |      |         |     |  x  |     |             |             |
| black                  |      |         |     |  x  |     |             |             |
| mypy                   |      |         |     |  x  |     |             |             |
| pre_commit             |      |         |     |  x  |     |             |             |
| openconnect_sso        |      |         |     |  x  |     |             |             |
| ansible\*              |      |         |     |  x  |     |             |             |
| kompose                |      |         |     |     |  x  |             |             |
| act                    |      |         |     |     |  x  |             |             |

## Dependencies

Developed and testes with Ansible 2.14.4

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
