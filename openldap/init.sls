{% from 'openldap/map.jinja' import openldap with context %}
{% set ldap_uri = openldap.get('uri', False) %}
{% set rootpw = openldap.get('rootpw', False) %}

{% if ldap_uri or rootpw %}
include:
    {#  Only install LDAP-client if pillar[openldap:uri] is set #}
    {% if ldap_uri %}
    - openldap.client
    {% endif %}

    {#- Install the LDAP-server if pillar[openldap:rootpw] is set #}
    {% if rootpw %}
    - openldap.server
    {% endif %}
{% endif %}
