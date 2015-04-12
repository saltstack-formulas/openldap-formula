{% from 'openldap/map.jinja' import openldap with context %}
ldap-client:
  pkg.installed:
    - name: {{ openldap.client_pkg }}
  file.managed:
    - name: {{ openldap.client_config }}
    - source: salt://openldap/files/ldap.conf
    - template: jinja
    - user: root
    - group: {{ openldap.su_group }}
    - mode: 644
    - makedirs: True
    - require:
      - pkg: ldap-client

