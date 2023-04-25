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

```yml
clients:
  - name: "{{ ansible_user }}"
    dev: true # will used for install (git|zsh|tmux|python|npm) per user
    updateOrCreate: false # if the user should be updated with below values
    # shell: /bin/bash
    # group: 'adm, cdrom, sudo'
    # createhome: true
    # password:
install_server_service_name: "{{ service_name }}"
install_server_git_user: "{{ ansible_user }}"
install_server_git_email: "{{ ansible_user }}"
install_server_config:
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
  snap_node: false
  snap_ruby: false
  # OTHER --------------------------------
  git: false
  zsh: false
  tmux: false
  # PYTHON --------------------------------
  python: false
  python_pip: false
  python_pip_update: false
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
  # NPM --------------------------------
  npm_typescript: false
  # GO --------------------------------
  go_kompose: false
  # OTHER --------------------------------
  mongodb: false
  java: false
  java_ant: false
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
      install_server_config: []
```

## License

MIT
