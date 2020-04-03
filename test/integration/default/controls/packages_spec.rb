# frozen_string_literal: true

control 'openldap packages' do
  title 'should be installed'

  # client_pkg & server_pkg
  pkgs =
    case platform[:family]
    when 'debian'
      %w[ldap-utils slapd]
    when 'redhat'
      %w[openldap-clients openldap-servers]
    when 'suse'
      %w[openldap2-client openldap2]
    when 'bsd'
      %w[openldap-client openldap-server]
    else
      %w[openldap openldap]
    end

  pkgs.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end
