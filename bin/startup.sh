#!/bin/bash
echo "================================================="
aws --version
ecs-cli --version
echo "node $(node --version)"
echo "yarn $(yarn --version)"
echo "docker $(docker --version)"
echo "serverless $(serverless --version)"
echo "================================================="
