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
      # The name is used for TLS auth, it can be a fake hostname,
      # outside DNS
      reverts_server_name: tunnel.example.com
      # Exposed port on the server. It should be behind
      # a proxy with LetsEncrypt
      reverst_http_port: 8087
      reverst_groups:
        # You can have different group with distinct auth
        tunnel.example.com:
          # The proxy use virtual hosting.
          # The HTTP 'Host' header is mandatory,
          # for local debug use something like this :
          # curl -v -H "Host: tunnel.exemple.com" http://localhost:8181
          - tunnel.example.com
```
