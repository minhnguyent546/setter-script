#!/usr/bin/env bash

# general utility functions
#

function ecerr() {
  local msg="$1"; shift
  printf "${__script_name:-error}: ${msg}\n" "$@" >&2
}

function missing_cmd() {
  local cmd="$1";
  ecerr "missing required command: %s" "$cmd"
  exit 1
}

function show_try_help() {
  ecerr "try '%s --help' for more information" "${__script_name}"
}

function cmd_exists() {
  cmd="$1"
  command -v "$cmd" &> /dev/null && return 0
  return 1
}

function regular_cmd_exists() {
  cmd="$1"
  hash "$cmd" 2> /dev/null && return 0
  return 1
}
