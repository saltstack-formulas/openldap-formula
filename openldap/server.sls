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
{%- if not openldap.ng %}
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
{% else %}

ldap-ldif-configdir:
  file.directory:
    - name: {{ openldap.ldif_configdir }}
    - user: {{ openldap.user }}
    - group: {{ openldap.group }}
    - mode: 700
    - require:
      - pkg: ldap-server-packages

ldap-ldif-base-config:
  file.managed:
    - name: {{ openldap.ldif_configdir }}/ldap-base-config.ldif
    - source: salt://openldap/templates/ldap-base-config.ldif.j2
    - template: jinja
    - user: {{ openldap.user }}
    - group: {{ openldap.group }}
    - mode: 600
    - require:
      - file: ldap-ldif-configdir

ldapmodify-base-config:
  cmd.wait:
    - name: ldapmodify -Y EXTERNAL -H ldapi:/// -f {{ openldap.ldif_configdir }}/ldap-base-config.ldif
    - watch:
      - file: ldap-ldif-base-config

## TODO: Make it dependent on DB type, do not hardcode directories...

ldap-db-settings:
  file.managed:
    - name: {{ openldap.slapd_directory }}/DB_CONFIG
    - source: /usr/share/openldap-servers/DB_CONFIG.example
    - user: {{ openldap.user }}
    - group: {{ openldap.group }}
    - require:
      - pkg: ldap-server-packages

domain-configuration:
  file.managed:
    - name: {{ openldap.ldif_configdir }}/domain-config.ldif
    - source: salt://openldap/templates/domain-config.ldif.j2
    - template: jinja
    - user: {{ openldap.user }}
    - group: {{ openldap.group }}
    - mode: 600
    - require:
      - file: ldap-ldif-configdir

ldapadd-domain-configuration:
  cmd.run:
    - name: ldapadd -Y EXTERNAL -H ldapi:/// -f {{ openldap.ldif_configdir }}/domain-config.ldif && touch {{ openldap.ldif_configdir }}/domain-config.ldif.created
    - creates: {{ openldap.ldif_configdir }}/domain-config.ldif.created
    - require:
      - file: domain-configuration

{% for schema in openldap.slapd_includes %}
ldapadd-schema-{{ schema }}:
  cmd.run:
    - name: ldapadd -Y EXTERNAL -H ldapi:/// -f {{ schema | replace('.schema', '.ldif') }} && touch {{ openldap.ldif_configdir }}/schema_{{ schema | replace('/', '_') }}.created
    - creates: {{ openldap.ldif_configdir }}/schema_{{ schema | replace('/', '_') }}.created
    - require:
      - file: ldap-ldif-configdir
    - require_in:
      - cmd: ldapadd-domain-configuration 
{% endfor %}


{% endif %}



