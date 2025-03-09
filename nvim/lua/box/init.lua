require("box.remap")
require("box.set")
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      ".ctxt",
      ".class",
      ".bluej",
      ".out"
    }
  }
}

