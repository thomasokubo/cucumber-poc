#!/usr/bin/env bash

docker build -t poc/cucumber .
rm Gemfile.lock
