{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    python313Packages.mkdocs-material
  ];

  shellHook = ''
    mkdocs serve -a 0.0.0.0:9813
  '';
}
