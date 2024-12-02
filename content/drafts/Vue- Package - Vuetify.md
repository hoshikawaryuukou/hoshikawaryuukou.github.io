---
title: "Vue- Package - Vuetify"
date: 2024-09-21 20:11:00
draft: true

tags: ["Vue"]
---

## Guide
- [Vuetify — A Vue Component Framework](https://vuetifyjs.com/en/)

## Install
```bash
pnpm add vuetify
pnpm add -D vite-plugin-vuetify
pnpm add @mdi/font
```

## Config

### src/plugins/vuetify.ts
```ts
import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'
import { createVuetify } from 'vuetify'

export default createVuetify()
```

### vite.config.ts
```ts
plugins: [
  vue(),
  vuetify({ autoImport: true }), // Enabled by default
]
```

### main.ts
```ts
import vuetify from './plugins/vuetify'

app.use(vuetify)
```

