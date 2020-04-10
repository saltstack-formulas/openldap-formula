# Changelog

## [0.7.2](https://github.com/saltstack-formulas/openldap-formula/compare/v0.7.1...v0.7.2) (2020-04-10)


### Tests

* **config_spec:** test bug fixed by [#33](https://github.com/saltstack-formulas/openldap-formula/issues/33) ([50de5b9](https://github.com/saltstack-formulas/openldap-formula/commit/50de5b91dca94bc2d665e4eb6467bb3fbdf2e1b4))

## [0.7.1](https://github.com/saltstack-formulas/openldap-formula/compare/v0.7.0...v0.7.1) (2020-04-10)


### Bug Fixes

* **slapd.conf:** fix additional module loading ([86e1b2b](https://github.com/saltstack-formulas/openldap-formula/commit/86e1b2b55e3280c5ea4c1334be0d3e599166e7dd))

# [0.7.0](https://github.com/saltstack-formulas/openldap-formula/compare/v0.6.2...v0.7.0) (2020-04-05)


### Features

* **indexes:** add indexes management in slapd.conf ([afee20b](https://github.com/saltstack-formulas/openldap-formula/commit/afee20b4146daeb9bb5b8bc05ce56f69436526c3))


### Tests

* **config_spec:** add test for indexes management in `slapd.conf` ([0813e52](https://github.com/saltstack-formulas/openldap-formula/commit/0813e52a213079caab021f81bec844db42500faf))

## [0.6.2](https://github.com/saltstack-formulas/openldap-formula/compare/v0.6.1...v0.6.2) (2020-04-05)


### Tests

* **config_spec:** add InSpec control to test include file ([bb36517](https://github.com/saltstack-formulas/openldap-formula/commit/bb36517f5f541a38b7e313270662ce360a624670))
* **config_spec:** fix tests related to `root`/`wheel` group ([4427c98](https://github.com/saltstack-formulas/openldap-formula/commit/4427c98f4968df76cd53a245110f9cc4f6d562b3))

## [0.6.1](https://github.com/saltstack-formulas/openldap-formula/compare/v0.6.0...v0.6.1) (2020-04-04)


### Bug Fixes

* **include-ex-pat:** do work`exclude_pat` and slapd_inc dir refactor ([4f28537](https://github.com/saltstack-formulas/openldap-formula/commit/4f285378a74ea1745b0f26bc66dc350de81f4a57))

# [0.6.0](https://github.com/saltstack-formulas/openldap-formula/compare/v0.5.4...v0.6.0) (2020-04-03)


### Bug Fixes

* **salt-lint:** fix all errors ([6b1f970](https://github.com/saltstack-formulas/openldap-formula/commit/6b1f970eaabf6267205c819416a1503616df53c1))
* **yamllint:** fix all errors ([dd94ea5](https://github.com/saltstack-formulas/openldap-formula/commit/dd94ea5373ede5fa91737933c164abb7b87c746b))


### Code Refactoring

* **maps:** remove duplicates and improve efficiency ([73f5e8b](https://github.com/saltstack-formulas/openldap-formula/commit/73f5e8bf7e169c381cca8d65f732486a247252c6))


### Documentation

* **readme:** move to `docs/` directory and apply common structure ([0d62057](https://github.com/saltstack-formulas/openldap-formula/commit/0d6205791e74e04d065c41d2564cde01815d28ce))


### Features

* **semantic-release:** implement for this formula ([9188fb7](https://github.com/saltstack-formulas/openldap-formula/commit/9188fb7a7dd16af3e26fc20c39774ec4d9c54bfd))


### Tests

* **inspec:** add package, config & service tests + pillar ([13f7250](https://github.com/saltstack-formulas/openldap-formula/commit/13f725032b1db0b37928b318c81816ce8da967e7))
