{
  pkgs ? import <nixpkgs> {
    config = { };
    overlays = [ ];
  },
}:

let
  # Najmanji primjer: rezultat gradnje je jedna tekstualna datoteka.
  tekst = pkgs.writeText "pozdrav.txt" "Hello world iz derivacije!\n";
in
{
  inherit tekst;

  # Izvršna skripta s deklariranom ovisnošću dostupnom u PATH-u.
  skripta = pkgs.writeShellApplication {
    name = "pozdrav";
    runtimeInputs = [ pkgs.coreutils ];
    text = ''
      printf 'Hello world! Sustav: '
      uname -s
    '';
  };

  # Recept gradnje iz izvornog koda: prevoditelj dolazi iz stdenv-a.
  program = pkgs.stdenv.mkDerivation {
    pname = "hello-c";
    version = "1.0";
    src = ./hello.c;
    dontUnpack = true;

    buildPhase = ''
      runHook preBuild
      $CC "$src" -o hello-c
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p "$out/bin"
      cp hello-c "$out/bin/hello-c"
      runHook postInstall
    '';

    meta.mainProgram = "hello-c";
  };
}
