name: module3_task3

on:
  push:
    tags:
      - '*'

jobs:
  release:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Set up Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'

      - name: Build Hugo website
        run: hugo --minify --source ./website

      - name: Create release
        uses: softprops/gh-release@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          files: |
            awesome-website.zip
          release_name: ${{ github.ref }}
          body: |
            $(cat DEPLOY.md)
          body_path: ./DEPLOY.md

      - name: Update DEPLOY.md
        run: echo "::set-output name=content::$(cat DEPLOY.md | sed -e 's/\[tag\]/${{ github.ref }}/g')" > ${{ github.workspace }}/DEPLOY.md

      - name: Commit and push changes
        uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Update DEPLOY.md
          commit_options: '--author="GitHub Actions"'

      - name: Push changes
        run: git push origin ${{ github.ref }}
