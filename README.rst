openldap
========

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

.. note::

    ``openldap/map.jinja`` is missing serveral values for os_family=RedHat.

openldap.client
---------------

Install and configure ldap client.
You should at least set ``pillar[openldap:base]`` and 
``pillar[openldap:uri]`` to provide the client with
minimal configuration.

openldap.server
---------------

.. note::
    
    This state is incomplete and probably broken.

Install and configure OpenLDAP-server ``slapd``.

As for the client you should specify ``pillar[openldap:base]``.
The ``rootdn`` is set via ``pillar['openldap:rootdn']`` (defaults
to "cn=Manager," + ``pillar[openldap:base]``), the ``rootpw`` via 
``pillar[openldap:rootpw]``. A hash for the later can be generated 
with ``slappasswd(8)``.
