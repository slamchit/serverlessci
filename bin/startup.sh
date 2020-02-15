#!/bin/bash
echo "================================================="
echo "$(aws --version)"
echo "$(ecs-cli --version)"
echo "node $(node --version)"
echo "yarn $(yarn --version)"
echo "docker $(docker --version)"
echo "serverless $(serverless --version)"
echo "================================================="
