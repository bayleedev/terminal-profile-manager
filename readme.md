## Terminal Profile Manager

Automate the setup of your terminal profile, or try on a few profiles to see how they feel.

### Install

~~~ bash
gem install terminal-profile-manager
~~~

### Usage
~~~ bash
tpm list [--remote]
tpm use PROFILE [--all] [--default]
tpm install NAME [URL]
tpm help
~~~

#### List

~~~ bash
tpm list            # List all locally installed profile
tpm list --remote   # List profile that can be installed
~~~

#### Use

~~~ bash
tpm use Grass           # Use the grass profile in the current window
tpm use Grass --all     # Use the grass them in all terminal windows
tpm use Grass --default # Use Grass, and set it as the default for new terminals
~~~

#### Install

~~~ bash
tpm install SolarizedDark              # Install a pre-defined profile
tpm install Custom http://git.io/vGLaB # Install a custom profile
~~~

Remote themes are listed in the [profiles.json](./profiles.json) file.
