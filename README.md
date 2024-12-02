Revest playbook
===============

Deploy with [Ansible](https://docs.ansible.com/ansible/latest/index.html) the [Reverts](https://github.com/flipt-io/reverst) proxy, and enjoy upside down connection to share HTTP services behind a NAT.

Tools
-----

You must have golang installed localy.

Tools, **reverst** and **cfssl** are installed in `./go/bin/` folder.

Secrets
-------

Secrets, SSL stuffs and password are stored in `./secrets/{{ inventory_hostname }}/` folder.

Inventory
---------

Your inventory should look like that

```yaml
---

reverstd:
  hosts:
    proxy.example.com: # your consenting server
      reverts_archi: arm64 # maybe amd64 ?
      reverts_server_name: tunnel.example.com # this name is used for TLS auth, it can be a fake hostname, outside DNS
      reverst_http_port: 8087 # exposed port on the server. It should be behind a proxy with LetsEncrypt
      reverst_groups:
        tunnel.example.com: # you can have more than one group
          - tunnel.example.com # a group can handles multiple hosts
```
