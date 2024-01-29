# Configure MacOS X Laptop

Make sure your user is a member of `admin`.

The MacOS X Command Line Tools (CLT) are required.

```shell
sudo bash ./bin/install_osx_clt.sh
```


```shell
# Install ansible
python3 -m venv .venv

source .venv/bin/activate

pip install -U pip ansible
```

Create secrets to be used.

```shell
ansible_secret_dir="${HOME}/.ansible/etc"
user_accountname="{{ UserAccountName }}"
user_fullname="{{ FirstAndLastSpaceSeparated }}"
user_password="{{ UserPassword }}"


mkdir -p ${ansible_secret_dir}

printf '%s' "{{ YourAnsibleVaultPassword }}" | tee "${ansible_secret_dir}/vault_secret.txt"

printf 'user_accountname: "%s"\n' "${user_accountname}" | tee confidential.yml
printf 'user_fullname: "%s"\n' "${user_fullname}" | tee -a confidential.yml
ansible-vault encrypt_string --vault-id "${ansible_secret_dir}/vault_secret.txt" --name 'user_password' "${user_password}" >> confidential.yml 

```


```shell
ansible-playbook \
  --ask-become-pass \
  --vault-id user_password@"${ansible_secret_dir}/vault_secret.txt" \
 conference_room_kiosk.yml 
```
