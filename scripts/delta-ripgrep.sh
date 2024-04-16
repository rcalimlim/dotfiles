#!/bin/bash

USER_PARAMS=$1

rg --json -p "$USER_PARAMS" | delta
