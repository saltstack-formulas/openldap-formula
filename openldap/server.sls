{% from 'openldap/map.jinja' import openldap with context %}
ldap-server:
  pkg:
    - installed
    - name: {{ openldap.server_pkg }}
  file:
    - managed
    - name: {{ openldap.server_config }}
    - source: salt://openldap/files/slapd.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: ldap-server

