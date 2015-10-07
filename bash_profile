if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
## MacPorts Installer addition on 2012-11-19_at_20:57:00: adding an appropriate PATH variable for use with MacPorts.
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export PATH=/opt/local/bin:/opt/local/sbin:$HOME/bin:/usr/local/mysql/bin/:$HOME/Dropbox/bin/:$PATH
## Setting PATH for Python 2.7
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH
#
## Setting PATH for Python 3.4
## The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
#export PATH
export PATH=$HOME/bin:$PATH
#export PATH=$PATH:$HOME/.cabal-sandbox/bin 
#
## Setting PATH for Python 2.7
## The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH