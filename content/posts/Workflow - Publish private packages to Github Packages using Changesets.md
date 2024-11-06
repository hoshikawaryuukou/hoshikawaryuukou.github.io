---
title: "Workflow - Publish private packages to Github Packages using Changesets"
date: 2024-11-04 21:11:00
draft: false

tags: ["Workflow", "Github", "pnpm"]
---

## Guide
- [changesets/action](https://github.com/changesets/action/)

## .github/workflows/publish-package.yml
```yml
name: Publish package to GitHub Packages

on:
  workflow_dispatch:
  release:
    types: [published]

concurrency: ${{ github.workflow }}-${{ github.ref }}

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v4

      - uses: pnpm/action-setup@v4
        with:
          version: 9
          run_install: false

      - uses: actions/setup-node@v4
        with:
          node-version: '20.x'
          registry-url: 'https://npm.pkg.github.com'
          scope: '@user-or-organization'

      - name: Install dependencies
        run: pnpm install

      - name: Build package
        run: pnpm build

      - name: Create Release Pull Request or Publish to npm
        id: changesets
        uses: changesets/action@v1
        with:
          # This expects you to have a script called release which does a build for your packages and calls changeset publish
          publish: pnpm release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Done
        if: steps.changesets.outputs.published == 'true'
        # You can do something when a publish happens.
        run: echo "Done"
```