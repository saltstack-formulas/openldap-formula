{% from 'openldap/map.jinja' import openldap with context %}


ldap-server-packages:
  pkg.installed:
    - name: {{ openldap.server_pkg }}

ldap-server-service:
  service.running:
    - name: {{ openldap.service }}
    - enable: True
    - require:
      - pkg: ldap-server-packages
      - file: ldap-server-configuration

ldap-server-configuration:
  file.managed:
    - name: {{ openldap.server_config }}
    - source: salt://openldap/templates/slapd.conf.j2
    - template: jinja
    - user: root
    - group: {{ openldap.su_group }}
    - mode: 644
    - makedirs: True
    - require:
      - pkg: ldap-server-packages

    

