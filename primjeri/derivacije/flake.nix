{
  description = "Osnovne derivacije: tekst, skripta, C program i graf ovisnosti";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      packages = forAllSystems (system:
        let
          primjeri = import ./default.nix { pkgs = nixpkgs.legacyPackages.${system}; };
        in primjeri // { default = primjeri.program; }
      );
    };
}
