
Changelog
=========

`0.8.0 <https://github.com/saltstack-formulas/openldap-formula/compare/v0.7.2...v0.8.0>`_ (2020-12-16)
----------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile.lock:** add to repo with updated ``Gemfile`` [skip ci] (\ `c6140e2 <https://github.com/saltstack-formulas/openldap-formula/commit/c6140e220c521db29ed5447a50fb2270f5c1719d>`_\ )
* **gitlab-ci:** use GitLab CI as Travis CI replacement (\ `0851056 <https://github.com/saltstack-formulas/openldap-formula/commit/0851056ebd01de4b8c0f1c49c5ba699929500182>`_\ )
* **kitchen:** use ``saltimages`` Docker Hub where available [skip ci] (\ `b5ca89a <https://github.com/saltstack-formulas/openldap-formula/commit/b5ca89a759a1d79c3626127ffd130400ca2a32b7>`_\ )
* **kitchen+travis:** add new platforms [skip ci] (\ `b9e383b <https://github.com/saltstack-formulas/openldap-formula/commit/b9e383b2831207e0bae227d432d006e4fd22bad0>`_\ )
* **kitchen+travis:** adjust matrix to add ``3000.2`` & remove ``2018.3`` [skip ci] (\ `5248c38 <https://github.com/saltstack-formulas/openldap-formula/commit/5248c38cc2955b4d5f208e0316165fedc491bdcb>`_\ )
* **kitchen+travis:** adjust matrix to add ``3000.3`` [skip ci] (\ `b490acf <https://github.com/saltstack-formulas/openldap-formula/commit/b490acfe9a1d613cc2985f7da4991fc53bc9f31e>`_\ )
* **kitchen+travis:** remove ``master-py2-arch-base-latest`` [skip ci] (\ `31fd36b <https://github.com/saltstack-formulas/openldap-formula/commit/31fd36b5ee4fafa384eae2cc9aae019e2ae2dab3>`_\ )
* **pre-commit:** add to formula [skip ci] (\ `c52698c <https://github.com/saltstack-formulas/openldap-formula/commit/c52698cf5fa9fab279764e4353324560b3704636>`_\ )
* **pre-commit:** enable/disable ``rstcheck`` as relevant [skip ci] (\ `9522b01 <https://github.com/saltstack-formulas/openldap-formula/commit/9522b0168b5ff8dbfaa4972c8fd74bd7e8bbbc03>`_\ )
* **pre-commit:** finalise ``rstcheck`` configuration [skip ci] (\ `d8c63a6 <https://github.com/saltstack-formulas/openldap-formula/commit/d8c63a654145f6f8e31ac661a23ea2808b8c842a>`_\ )
* **travis:** add notifications => zulip [skip ci] (\ `0fd68c1 <https://github.com/saltstack-formulas/openldap-formula/commit/0fd68c1498ce2ad61bdec4b5b37e6fce9ceb9857>`_\ )
* **workflows/commitlint:** add to repo [skip ci] (\ `e86ecaa <https://github.com/saltstack-formulas/openldap-formula/commit/e86ecaa40193b231c99d8c4e90a2ea882d335d19>`_\ )

Features
^^^^^^^^


* **tls:** manage tls on slapd conf (\ `1d83044 <https://github.com/saltstack-formulas/openldap-formula/commit/1d830448359602600038ec62072d47062908e97f>`_\ )

`0.7.2 <https://github.com/saltstack-formulas/openldap-formula/compare/v0.7.1...v0.7.2>`_ (2020-04-10)
----------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **config_spec:** test bug fixed by `#33 <https://github.com/saltstack-formulas/openldap-formula/issues/33>`_ (\ `50de5b9 <https://github.com/saltstack-formulas/openldap-formula/commit/50de5b91dca94bc2d665e4eb6467bb3fbdf2e1b4>`_\ )

`0.7.1 <https://github.com/saltstack-formulas/openldap-formula/compare/v0.7.0...v0.7.1>`_ (2020-04-10)
----------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **slapd.conf:** fix additional module loading (\ `86e1b2b <https://github.com/saltstack-formulas/openldap-formula/commit/86e1b2b55e3280c5ea4c1334be0d3e599166e7dd>`_\ )

`0.7.0 <https://github.com/saltstack-formulas/openldap-formula/compare/v0.6.2...v0.7.0>`_ (2020-04-05)
----------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **indexes:** add indexes management in slapd.conf (\ `afee20b <https://github.com/saltstack-formulas/openldap-formula/commit/afee20b4146daeb9bb5b8bc05ce56f69436526c3>`_\ )

Tests
^^^^^


* **config_spec:** add test for indexes management in ``slapd.conf`` (\ `0813e52 <https://github.com/saltstack-formulas/openldap-formula/commit/0813e52a213079caab021f81bec844db42500faf>`_\ )

`0.6.2 <https://github.com/saltstack-formulas/openldap-formula/compare/v0.6.1...v0.6.2>`_ (2020-04-05)
----------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **config_spec:** add InSpec control to test include file (\ `bb36517 <https://github.com/saltstack-formulas/openldap-formula/commit/bb36517f5f541a38b7e313270662ce360a624670>`_\ )
* **config_spec:** fix tests related to ``root``\ /\ ``wheel`` group (\ `4427c98 <https://github.com/saltstack-formulas/openldap-formula/commit/4427c98f4968df76cd53a245110f9cc4f6d562b3>`_\ )

`0.6.1 <https://github.com/saltstack-formulas/openldap-formula/compare/v0.6.0...v0.6.1>`_ (2020-04-04)
----------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **include-ex-pat:** do work\ ``exclude_pat`` and slapd_inc dir refactor (\ `4f28537 <https://github.com/saltstack-formulas/openldap-formula/commit/4f285378a74ea1745b0f26bc66dc350de81f4a57>`_\ )

`0.6.0 <https://github.com/saltstack-formulas/openldap-formula/compare/v0.5.4...v0.6.0>`_ (2020-04-03)
----------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **salt-lint:** fix all errors (\ `6b1f970 <https://github.com/saltstack-formulas/openldap-formula/commit/6b1f970eaabf6267205c819416a1503616df53c1>`_\ )
* **yamllint:** fix all errors (\ `dd94ea5 <https://github.com/saltstack-formulas/openldap-formula/commit/dd94ea5373ede5fa91737933c164abb7b87c746b>`_\ )

Code Refactoring
^^^^^^^^^^^^^^^^


* **maps:** remove duplicates and improve efficiency (\ `73f5e8b <https://github.com/saltstack-formulas/openldap-formula/commit/73f5e8bf7e169c381cca8d65f732486a247252c6>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** move to ``docs/`` directory and apply common structure (\ `0d62057 <https://github.com/saltstack-formulas/openldap-formula/commit/0d6205791e74e04d065c41d2564cde01815d28ce>`_\ )

Features
^^^^^^^^


* **semantic-release:** implement for this formula (\ `9188fb7 <https://github.com/saltstack-formulas/openldap-formula/commit/9188fb7a7dd16af3e26fc20c39774ec4d9c54bfd>`_\ )

Tests
^^^^^


* **inspec:** add package, config & service tests + pillar (\ `13f7250 <https://github.com/saltstack-formulas/openldap-formula/commit/13f725032b1db0b37928b318c81816ce8da967e7>`_\ )
