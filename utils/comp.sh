#!/usr/bin/env bash

# the function below is a wrapper for compiling a c++ file
#

source "${_SETTER_DIR}/env/colors.sh"
source "${_SETTER_DIR}/utils/util.sh"

comp() {
  local quiet=false
  file="$1"

  CXX="${CXX:-g++}"
  CPP_VERSION="${CPP_VERSION:-c++20}"
  CXXFLAGS="${CXXFLAGS:--std=$CPP_VERSION -Wall -Wextra}"
  TO_NANO="1000000000"

  file="${file%.cpp}.cpp"

  if [[ ! -f "$file" ]]; then
    echo ""
    return
  fi
  start_time=$(date +%s%N)
  output_file="${file%.*}.out"

  [[ "$quiet" == false ]] && echo -en "Compiling ${B_CYAN}${file}${RESET} with ${CPP_VERSION}..." >&2
  $CXX $CXXFLAGS "$file" -o "$output_file" 2> /dev/null
  if (( $? != 0 )); then
    echo ""
    return
  fi

  end_time=$(date +%s%N)
  elapsed_time=$(echo "($end_time - $start_time) / $TO_NANO" | bc -l)
  [[ "$quiet" == false ]] && printf "\t[Finished in %0.1fs --> ${B_GREEN}${output_file}${RESET}*]\n" "$elapsed_time" >&2
  echo "$output_file"
}
