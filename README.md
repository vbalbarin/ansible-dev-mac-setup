# OSX XDG

Make sure your user is a member of `admin`


```shell
# Install ansible
python3 -m venv .venv

source .venv/bin/activate

pip install -U pip ansible

# Setup XDG
ansible-playbook \
    --inventory ./inventory \
    --limit localhost \
    --connection=local \
    localhost-xdgosx.yaml

# Setup Homebrew
ansible-playbook --ask-become-pass \
    --inventory ./inventory \
    --limit localhost \
    --connection=local \
    localhost-homebrew.yaml

```
