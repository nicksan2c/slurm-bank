#!/usr/bin/env bash

. ../wvtest.sh

#set -e

sbank()
{
    "../src/sbank" "$@"
}

WVSTART "init"

WVFAIL sbank

WVSTART "sbank time"

WVPASSEQ "$(sbank time calc -t 4-00:00:00)" "96"
WVPASSEQ "$(sbank time estimate -N 4 -c 8 -t 24)" "768"
WVPASSEQ "$(sbank time estimate -n 32 -t 96)" "3072"
WVPASSEQ "$(sbank time estimate -n 32 -t $(sbank time calc -t 4-00:00:00))" "3072"
WVPASSEQ "$(sbank time estimate -n 32 -t 96)" "$(sbank time estimate -n 32 -t $(sbank time calc -t 4-00:00:00))"
