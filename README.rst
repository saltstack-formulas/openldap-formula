openldap
========

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

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
