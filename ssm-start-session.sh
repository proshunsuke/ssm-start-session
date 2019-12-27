#!/bin/bash

main() {
  name=$1
  profile=$2

  instance_info_json=$(aws ec2 describe-instances --filter "Name=tag:Name,Values=$name" --output json --profile "$profile")
  instance_id=$(echo "$instance_info_json" | jq -r '.Reservations[] | .Instances[] | .InstanceId')

  aws ssm start-session --target "$instance_id" --profile "$profile"
}

usage() {
    cat <<EOF
$(basename "${0}") is a tool for ...

Usage:
    $(basename "${0}") [<options>] arg1 arg2

Description:
    arg1: instance name which you want to connect
    arg2: aws profile name

Options:
    --version, -v     print $(basename "${0}") version
    --help, -h        print this
EOF
}

version() {
  cat <<EOF
v0.0.1
EOF
}

for OPT in "$@"
do
  case "$OPT" in
    -h | '--help')
      usage
      ;;
    -v | '--version')
      version
      ;;
    *)
      main "$1" "$2"
      break
      ;;
  esac
done

