#!/bin/bash

TOOLS=("python3" "sqlite3" "gcc" "clang" "make" "git" "node" "npm" "ruby" "perl" "java" "javac" "pip3" "docker" "cmake" "curl" "wget")

SHOW_VERSIONS=false

if [[ "$1" == "-v" ]]; then
  SHOW_VERSIONS=true
fi

check_tool() {
  local tool=$1
  if command -v "$tool" &> /dev/null; then
    echo "$tool is installed"
    if $SHOW_VERSIONS; then
      version=$("$tool" --version 2>/dev/null || "$tool" -v 2>/dev/null || "$tool" -V 2>/dev/null || echo "Version check not supported")
      echo "$tool version: $version"
    fi
  else
    echo "$tool is NOT installed"
  fi
}

for tool in "${TOOLS[@]}"; do
  check_tool "$tool"
done
