# OSX XDG

Make sure your user is a member of `admin`


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
