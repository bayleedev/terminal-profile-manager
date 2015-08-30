## Terminal Profile Manager

Automate the setup of your terminal profile, or try on a few profiles to see how they feel.

### Install

~~~
gem install terminal-profile-manager
~~~

### Usage
~~~
tpm list [--remote]
tpm use PROFILE [--all] [--default]
tpm install NAME [URL] [--apply] [--default]
tpm help
~~~

#### List

~~~
tpm list            # List all locally installed themes
tpm list --remote   # List themes that can be installed
~~~

#### Use

~~~
tpm use Grass           # Use the grass theme in the current window
tpm use Grass --all     # Use the grass them in all terminal windows
tpm use Grass --default # Use Grass, and set it as the default for new terminals
~~~

#### Install

~~~
tpm install SolarizedDark              # Install a pre-defined profile
tpm install Custom http://git.io/vGLaB # Install a custom theme
~~~