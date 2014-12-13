ldap:
  pkg.installed:
    {% if grains['os_family'] == 'RedHat' %}
    - pkgs:
      - openldap-servers
      - openldap-clients
    {% elif grains['os_family'] == 'Debian' %}
    - pkgs:
      - slapd
      - ldap-utils
    {% else %}
    - name: openldap
    {% endif %}
  file.managed:
    {% if grains['os_family'] == 'Debian' %}
    - name: /etc/ldap/ldap.conf
    {% else %}
    - name: /etc/openldap/ldap.conf
    {% endif %}
    - source: salt://openldap/files/ldap.conf
    - template: jinja
    - user: root
    - ldap_uri: "ldaps://ldap01.domain.com/ ldaps://p-chi-ldap02.domain.com/"
    - ldap_base: "dc=domain,dc=com" 
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: ldap

