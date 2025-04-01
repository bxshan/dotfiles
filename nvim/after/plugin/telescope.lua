local builtin = require('telescope.builtin')
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      ".ctxt",
      ".class",
      ".bluej",
      ".out",
      ".txt",
      ".vscode",
      ".json"
    }
  }
}
