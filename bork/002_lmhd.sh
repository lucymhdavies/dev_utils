#!/usr/bin/env bork satisfy
# BORK_CONTEXT: HOME


#
# Trust Vault Generated Certs
#

# Check if this cert is already in the keychain
ok check "security dump-trust-settings -s -d | grep lmhd.me"
if check_failed && satisfying; then
	# If not, download and trust
	ok download /tmp/lmhd_root.pem https://vault.lmhd.me/v1/pki_root/ca/pem
	ok check "sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /tmp/lmhd_root.pem"
fi
