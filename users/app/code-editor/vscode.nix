{ pkgs, ... }:

{
  programs.vscode.enable = true;

  # Override VSCode with custom flags
  home.packages = with pkgs; [
    (vscode.override {
      extraArgs = [
        "--enable-features=WaylandWindowDecorations"
        "--ozone-platform-hint=auto"
      ];
    })
  ];
}

