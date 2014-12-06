#!/bin/bash

find -type f -not -iname "setup.sh" | xargs -i cp {} $HOME/.{}
