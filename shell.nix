{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    python313Packages.mkdocs-material
  ];

  buildInputs = [pkgs.python313Packages.venv];

  shellHook = ''
    # Create venv if it doesn't exist
    if [ ! -d ".venv" ]; then
      python -m venv .venv
      ./.venv/bin/pip install --upgrade pip
      ./.venv/bin/pip install mkdocs-material mkdocs-to-pdf
    fi

    # Activate venv
    source .venv/bin/activate
  '';
}
