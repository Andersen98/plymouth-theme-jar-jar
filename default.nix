{ pkgs ? import <nixpkgs> {} }:

{
  plymouth-theme-jar-jar = pkgs.callPackage ./plymouth-theme-jar-jar.nix { };
}
