openldap
========

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

openldap.client
---------------

Install and configure ldap client.
You should at least set ``pillar[openldap:lookup:base]`` and 
``pillar[openldap:uri]`` to provide the client with
minimal configuration.

openldap.server
---------------

Install and configure OpenLDAP-server ``slapd``.

As for the client you should specify ``pillar[openldap:lookup:base]``.
The ``rootdn`` is set via ``pillar['openldap:lookup:rootdn']`` (defaults
to "cn=Manager," + ``pillar[openldap:lookup:base]``), the ``rootpw`` via 
``pillar[openldap:lookup:rootpw]``. A hash for the later can be generated 
with ``slappasswd(8)``.
