{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      yzhang.markdown-all-in-one
      zhuangtongfa.Material-theme
      ms-vscode.sublime-keybindings
      oderwat.indent-rainbow
    ];
  };
}
