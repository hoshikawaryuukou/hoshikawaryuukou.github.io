---
title: "Workflow - Create a template for typescript project"
date: 2024-10-11 09:13:00
draft: true

tags: ["Workflow", "Template"]
---

## Guide
- [Create a typescript utility library using Vite](https://dev.to/vinomanick/create-a-typescript-utility-library-using-vite-916)

## package.json

## tsconfig.ts

## typescript
```bash
pnpm add -D typescript
```

## eslint
```bash
pnpm add -D eslint
pnpm add -D eslint-config-prettier
pnpm add -D typescript-eslint
```

**eslint.config.js**
```js
import pluginJs from '@eslint/js';
import eslintConfigPrettier from 'eslint-config-prettier';
import globals from 'globals';
import tseslint from 'typescript-eslint';

export default [
  {
    files: ['**/*.{js,mjs,cjs,ts}'],
  },
  {
    languageOptions: {
      globals: { ...globals.browser, ...globals.node },
    },
  },
  pluginJs.configs.recommended,
  ...tseslint.configs.recommended,
  eslintConfigPrettier,
];
```

## prettier
```bash
pnpm add -D prettier
pnpm add -D prettier-plugin-organize-imports
```

**.prettierrc**
```json
{
  "semi": true,
  "trailingComma": "all",
  "singleQuote": true,
  "printWidth": 150,
  "endOfLine": "auto",
  "singleAttributePerLine": true,
  "vueIndentScriptAndStyle": true,
  "htmlWhitespaceSensitivity": "ignore",
  "plugins": ["prettier-plugin-organize-imports"],
  "overrides": [
    {
      "files": ".prettierrc",
      "options": {
        "parser": "json"
      }
    }
  ]
}

```

**.prettierignore**
```
dist
pnpm-lock.yaml
CHANGELOG*.md
```

## simple-git-hooks
```bash
pnpm add -D simple-git-hooks
```

**package.json**
```json
{
  "simple-git-hooks": {
    "pre-commit": "echo 'before commit'"
  }
}
```