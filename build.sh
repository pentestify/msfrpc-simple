#!/bin/bash
rake build
gem push pkg/msfrpc-simple-`cat lib/msfrpc-simple/version.rb | grep VERSION | cut -d '"' -f 2`.gem
