# frozen_string_literal: true

# Common across controls
su_group =
  case platform[:family]
  when 'bsd'
    'wheel'
  else
    'root'
  end

control 'openldap client configuration' do
  title 'should match desired lines'

  client_config =
    case platform[:family]
    when 'debian'
      '/etc/ldap.conf'
    when 'bsd'
      '/usr/local/etc/openldap/ldap.conf'
    else
      '/etc/openldap/ldap.conf'
    end

  describe file(client_config) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into su_group }
    its('mode') { should cmp '0644' }
    its('content') { should include 'BASE    dc=example,dc=com' }
    its('content') { should include 'URI    ldap://ldap.example.com' }
  end
end

control 'openldap server configuration' do
  title 'should match desired lines'

  server_config = '/etc/openldap/slapd.conf'
  owned_and_grouped = 'ldap'
  modulepath = '/usr/lib64/openldap'
  moduleload = ''
  case platform[:family]
  when 'debian'
    server_config = '/etc/ldap/slapd.conf'
    owned_and_grouped = 'openldap'
    modulepath = '/usr/lib/ldap'
    moduleload = 'back_hdb'
  when 'bsd'
    server_config = '/usr/local/etc/openldap/slapd.conf'
    modulepath = '/usr/local/libexec/openldap'
  end
  slap_modules = "modulepath	#{modulepath}"
  slap_modules += "\nmoduleload      #{moduleload}" unless moduleload.empty?

  describe file(server_config) do
    it { should be_file }
    it { should be_owned_by owned_and_grouped }
    it { should be_grouped_into owned_and_grouped }
    its('mode') { should cmp '0644' }
    its('content') { should include slap_modules }
    its('content') { should include 'rootdn		"cn=root,dc=example,dc=com"' }
    its('content') { should include 'rootpw		{SSHA}5++yqs7UNz22kAYf7jboAmklhavVXahK' }
    its('content') { should include 'index objectClass eq' }
    its('content') { should include 'index uid,cn eq,sub' }
  end
end

control 'openldap defaults configuration' do
  title 'should match desired lines'

  describe file('/etc/default/slapd') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into su_group }
    its('mode') { should cmp '0644' }
    its('content') do
      should include(
        'SLAPD_SERVICES="ldap://127.0.0.1:389/ ldaps:/// ldapi:///"'
      )
    end
    its('content') { should include 'SLAPD_OPTIONS="-4"' }
  end
end

control 'openldap include configuration' do
  title 'should match desired lines'

  slapd_include_dir =
    case platform[:family]
    when 'debian'
      '/etc/ldap/include'
    when 'bsd'
      '/usr/local/etc/openldap/include'
    else
      '/etc/openldap/include'
    end

  describe file(File.join(slapd_include_dir, 'my_include_file_name')) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into su_group }
    its('mode') { should cmp '0644' }
    its('content') do
      should include <<~INCLUDE_FILE
        access to *
          by self write
          by users read
          by anonymous auth
      INCLUDE_FILE
    end
  end
end
