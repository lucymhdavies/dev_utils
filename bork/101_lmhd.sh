#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE


#
# Trust Vault Generated Certs
#

# Check if this cert is already in the keychain
ok check "security dump-trust-settings -s -d | grep LMHD"
if check_failed && satisfying; then
	# If not, download and trust
	ok download /tmp/lmhd_root.pem https://vault.lmhd.me/v1/pki/root/ca/pem
	ok check "sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /tmp/lmhd_root.pem"
fi

# TODO: really need a way of checking if specific certs are trusted...
# Maybe store the pem files somewhere non-temporary, and use that to check?

# Probably involves:
# security trust-settings-export -s -d foo
