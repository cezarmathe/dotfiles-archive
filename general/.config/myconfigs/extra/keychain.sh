# Keychain SSH keys
eval $(keychain --agents ssh,gpg -q --eval id_rsa ~/.ssh/id_rsa)
eval $(keychain --agents ssh,gpg -q --eval github ~/.ssh/github)

# Keychain GPG
eval $(keychain --agents ssh,gpg -q --eval 61C1AF95BB594AD40DEEB7103F8F89E56422CBA8)
