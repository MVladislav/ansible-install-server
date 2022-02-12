# Role Name

_A brief description of the role goes here._

## Requirements

_Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required._

## Role Variables

```yml
install_server_service_name: "{{ service_name }}"
install_server_hostname: "{{ install_server_service_name }}"
install_server_git_user: "{{ ansible_user }}"
install_server_git_email: "{{ ansible_user }}"
install_server_config:
  dev: no
  apt_base: no
  apt_dev: no
  apt_exfat: no
  apt_libs: no
  apt_vpn: no
  apt_go: no
  apt_rasp_pi_pkg: no
  apt_qemu_guest_agent: no
  # dpkg_...: no
  # snap_...: no
  snap_microk8s: no
  snap_btop: no
  git: no
  zsh: no
  tmux: no
  python: no # base|dev
  go_kompose: no
  ruby: no
  npm: no
  mongodb: no
  java: no # base|dev
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
      install_server_hostname: "{{ install_server_service_name }}"
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
