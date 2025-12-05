{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # python3
    # gtk3
    python313Packages.mkdocs-material
    python313Packages.mkdocs-material-extensions
  ];

  # shellHook = ''

  #   echo "Entering mkdocs-to-pdf Nix Shell..."
  #
  #   if [ ! -d ".venv" ]; then
  #     echo "Setting up virtual environment and installing packages..."
  #     python3 -m venv .venv
  #     source .venv/bin/activate
  #     # The corrected line is below:
  #     pip install mkdocs-to-pdf mkdocs-material pymdown-extensions 
  #   else
  #     source .venv/bin/activate
  #   fi
  #
  #   echo "mkdocs and mkdocs-to-pdf are ready to use."
  # '';
}
