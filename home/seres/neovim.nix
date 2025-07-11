_: {
  stylix.targets.nvf.enable = false;

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        lsp.enable = true;
        lsp.formatOnSave = true;
        theme = {
          enable = true;
          name = "mini-base16";
          style = "dark";
          base16-colors = {
            base00 = "#242424";
            base01 = "#323232";
            base02 = "#404040";
            base03 = "#474747";
            base04 = "#4e4e4e";
            base05 = "#E6E6E6";
            base06 = "#F5F5F5";
            base07 = "#FFFFFF";
            base08 = "#E3C401";
            base09 = "#24DFC4";
            base0A = "#13C299";
            base0B = "#47B413";
            base0C = "#FF4D51";
            base0D = "#24ACD4";
            base0E = "#F2AFFD";
            base0F = "#E6E6E6";
          };
        };
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;
          enableDAP = true;
          rust.enable = true;
          nix.enable = true;
          clang = {
            enable = true;
            lsp.package = ["clangd"];
          };
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
