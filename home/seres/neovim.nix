_: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        lsp.enable = true;
        lsp.formatOnSave = true;
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;
          rust.enable = true;
          nix.enable = true;
          clang.enable = true;
          ts.enable = true;
          sql.enable = true;
          zig.enable = true;
          markdown.enable = true;
          html.enable = true;
          go.enable = true;
          lua.enable = true;
          haskell.enable = true;
        };
        extraPlugins = {};
        statusline.lualine.enable = true;
        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        filetree.neo-tree.enable = true;
        treesitter.context.enable = true;
        telescope.enable = true;
        utility.motion.leap.enable = true;
        binds.whichKey.enable = true;
        notes.todo-comments.enable = true;
        # notes.neorg.enable = true;
      };
    };
  };
}
