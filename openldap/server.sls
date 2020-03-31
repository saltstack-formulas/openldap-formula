{% from 'openldap/map.jinja' import openldap with context %}

{{ openldap.server_pkg }}:
  pkg.installed

{{ openldap.server_config }}:
  file.managed:
    - source: salt://openldap/files/slapd.conf
    - template: jinja
    - user: {{ openldap.user }}
    - group: {{ openldap.group }}
    - mode: 644
    - makedirs: True
    - require:
      - pkg: {{ openldap.server_pkg }}
    - context:
        openldap: {{ openldap | json }}

slapd_conf:
  file.managed:
    - name: {{ openldap.server_defaults }}
    - source: salt://openldap/files/slapd.default.jinja
    - template: jinja
    - user: root
    - group: {{ openldap.su_group }}
    - mode: 644
    - makedirs: True
    - require:
      - pkg: {{ openldap.server_pkg }}
    - context:
        openldap: {{ openldap | json }}

slapd_service:
  service.running:
    - name: {{ openldap.service }}
    - enable: True
    - watch:
      - file: slapd_conf

/etc/ldap/include:
  file.directory:
    - user: {{ openldap.user }}
    - group: {{ openldap.su_group }}
    - clean: True
    - makedirs: True
{% for file in salt['pillar.get']('openldap:includes',{}).keys() %}
    - exclude_pat: '{{file}}'

/etc/ldap/include/{{file}}:
  file.managed:
    - contents_pillar: openldap:includes:{{file}}
    - require:
      - file: /etc/ldap/include
    - watch_in:
        - service: slapd_service
{% endfor %}
