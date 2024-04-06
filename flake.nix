{
  description = "A clj-nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    flake-utils.lib.eachDefaultSystem (system:

      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };


      in {
        formatter = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.git
            pkgs.podman
            pkgs.yq
          ];
        };

      });
}
