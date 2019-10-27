{ pkgs ? import <nixpkgs> {} }:

let
    nixpkgs_unstable = import (
        fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz
    ) {};
in
pkgs.mkShell {
  buildInputs = [ 
      nixpkgs_unstable.bazel
      nixpkgs_unstable.bazel-buildtools
      nixpkgs_unstable.jdk
      # Will not be needed, just for x-checking
      nixpkgs_unstable.sbt
   ];
}
