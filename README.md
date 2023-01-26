# Role Name

**install server**

[![Ansible Lint](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml)

## Requirements

_Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required._

## Role Variables

```yml
install_server_service_name: "{{ service_name }}"
install_server_git_user: "{{ ansible_user }}"
install_server_git_email: "{{ ansible_user }}"
install_server_config:
  dev: no
  env_tun_setup: no
  # APT (1) -------------------------------
  apt_base: no
  apt_dev: no
  apt_build: no
  apt_libs: no
  # APT (2) -------------------------------
  apt_vpn: no
  apt_go: no
  apt_php: no
  apt_rasp_pi_pkg: no
  apt_qemu_guest_agent: no
  # DPKG ----------------------------------
  # dpkg_...: no
  # SNAP ----------------------------------
  snap_microk8s: no
  snap_multipass: no
  snap_btop: no
  # OTHER --------------------------------
  git: no
  zsh: no
  tmux: no
  # PYTHON --------------------------------
  python: false # base|dev
  pip_s_tui: false
  pip_virtualenv: false
  pip_autopep8: false
  pip_black: false
  pip_pre_commit: false
  pip_openconnect_sso: false
  # OTHER --------------------------------
  go_kompose: false
  ruby: false
  npm: false
  mongodb: false
  java: false # base|dev
clients:
  - name: "{{ ansible_user }}"
    dev: yes
    updateOrCreate: no
```

## Dependencies

_A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles._

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: servers
  roles:
    - role: install_server
      install_server_service_name: "{{ service_name }}"
      install_server_git_user: "{{ ansible_user }}"
      install_server_git_email: "{{ ansible_user }}"
      install_server_config: []
      clients:
        - name: "{{ ansible_user }}"
          dev: yes
          updateOrCreate: no
```

## License

GNU AFFERO GENERAL PUBLIC LICENSE

## Author Information

MVladislav
