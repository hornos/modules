#----------------------------------------------------------------------#
# system-wide profile.modules                                          #
# Initialize modules for all sh-derivative shells                      #
#----------------------------------------------------------------------#

function modenv() {
  trap "" 1 2 3
  echo -n "Loading Modules for "
  case "$0" in
    -bash|bash|*/bash) 
      echo "bash"
      . /usr/share/modules/init/bash
    ;;
    -ksh|ksh|*/ksh) 
      echo "ksh"
      . /usr/share/modules/init/ksh
    ;;
    -sh|sh|*/sh) 
      echo "sh"
      . /usr/share/modules/init/sh
    ;;
    *) 
      echo "default (sh)"
      . /usr/share/modules/init/sh
    ;;
  esac
  echo -e "\n Type 'module avail' for available modules"
  echo -e " Type 'module help'  for help"
  echo -e " Type 'module purge' to unload all modules"
  trap - 1 2 3
}

if ! test -r "${HOME}/.automod" ; then
cat << EOF
+----------------------------------------------------------------------+
| Modules                                                              |
|                                                                      |
| Type 'modenv' to active the module environment                       |
| If you want automatic loading create '\$HOME/.automod'                |
+----------------------------------------------------------------------+
EOF
else
  modenv
fi

