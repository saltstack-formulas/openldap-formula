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

slapd_include_dir:
  file.directory:
    - name: {{ openldap.slapd_include_dir }}
    - user: {{ openldap.user }}
    - group: {{ openldap.group }}
    - clean: True
    - makedirs: True
    - exclude_pat: "E@({{ openldap.includes.keys() | join ('|') }})"

{% for file in openldap.includes.keys() %}
slapd_include_{{ file }}:
  file.managed:
    - name: {{ openldap.slapd_include_dir ~ '/' ~ file }}
    - contents: |
        {{ openldap.includes[file] | indent(8, false) }}
    - require:
      - file: slapd_include_dir
    - watch_in:
        - service: slapd_service
{% endfor %}
