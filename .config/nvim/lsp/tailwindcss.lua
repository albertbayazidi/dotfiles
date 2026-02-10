return {
  cmd = { "tailwindcss-language-server", "--stdio" },

  filetypes = {
    "html", "javascript", "javascriptreact",
    "typescript", "typescriptreact", "svelte", "vue", "astro"
  },

  root_markers = {
    "tailwind.config.js",
    "tailwind.config.ts",
    ".git"
  },

  flags = {
    debounce_text_changes = 150,
  },

  init_options = {
    userLanguages = {
      svelte = "html",
      vue = "html",
    },
  },

}
