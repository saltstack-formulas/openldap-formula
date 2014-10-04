ldap-server:
  pkg:
    - installed
    {% if grains['os_family'] == 'RedHat' %}
    - pkgs:
      - openldap-servers
    {% elif grains['os_family'] == 'Debian' %}
    - pkgs:
      - slapd
    {% else %}
    - name: openldap
    {% endif %}
  file:
    - managed
    {% if grains['os_family'] == 'Debian' %}
    - name: /etc/ldap/slapd.conf
    {% else %}
    - name: /etc/openldap/slapd.conf
    {% endif %}
    - source: salt://openldap/files/slapd.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: ldap-server

