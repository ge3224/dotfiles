# Dotfiles and Ansible Playbook 

This repo contains dotfiles and an Ansible playbook for my Linux workstation
set up. It automates the installation and configuration of essential software
and settings. The dotfiles provide configuration for various tools, while the
Ansible playbook ensures that all required packages are installed and
configured correctly.

## Requirements

- An Arch Linux distribution
- Ansible installed
- Git installed
- A `vars.yml` file in the project root defining required keys (See [vars.example.yml](./vars.example.yml))
- A inventory file defining hosts, e.g. `localhost` (See [inventory.example.yml](./inventory.example.yml))

## Usage

1. Clone this repository:

```bash
git clone https://github.com/ge3224/dotfiles.git
cd dotfiles
```

2. Run the Ansible playbook:

```bash
ansible-playbook -i inventory.yml main.yml --ask-become-pass
```

Note: The `--ask-become-pass` flag prompts for the sudo password to perform administrative tasks.

## Contributing

If you have any improvements or fixes, please fork the repository, create a
feature branch, and submit a pull request. Make sure to follow the existing
code style and include descriptive commit messages.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
