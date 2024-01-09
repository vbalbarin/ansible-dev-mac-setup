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

ansible-playbook \
  --ask-become-pass \
  --inventory ./roles/macos-laptop/tests/inventory \
  main.yml

```
