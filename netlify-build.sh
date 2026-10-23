#!/usr/bin/env bash
set -e
cd backend
npm ci
npm run build
