# Role Name

**install server**

[![Ansible Lint](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/MVladislav/ansible-install-server/actions/workflows/ansible-lint.yml)
[![Ansible Molecule Test](https://github.com/MVladislav/ansible-install-server/actions/workflows/ci.yml/badge.svg)](https://github.com/MVladislav/ansible-install-server/actions/workflows/ci.yml)

## Requirements

_Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required._

## Role Variables

```yml
clients:
  - name: "{{ ansible_user }}"
    dev: true
    updateOrCreate: false
install_server_service_name: "{{ service_name }}"
install_server_git_user: "{{ ansible_user }}"
install_server_git_email: "{{ ansible_user }}"
install_server_config:
  dev: false
  env_tun_setup: false
  # APT (1) -------------------------------
  apt_base: false
  apt_archive: false
  apt_dev: false
  apt_build: false
  apt_libs: false
  # APT (2) -------------------------------
  apt_snap: false
  apt_vpn: false
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
  # OTHER --------------------------------
  git: false
  zsh: false
  tmux: false
  # PYTHON --------------------------------
  python: false
  python_pip: false
  python_venv: false
  python_dev: false
  pip_s_tui: false
  pip_virtualenv: false
  pip_autopep8: false
  pip_black: false
  pip_mypy: false
  pip_pre_commit: false
  pip_openconnect_sso: false
  pip_ansible: false
  # OTHER --------------------------------
  go_kompose: false
  ruby: false
  npm: false
  mongodb: false
  java: false
  java_ant: false
```

## Dependencies

_A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles._

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
      install_server_config: []
```

## License

GNU AFFERO GENERAL PUBLIC LICENSE

## Author Information

MVladislav
