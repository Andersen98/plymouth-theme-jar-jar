{
  inputs = {
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };
  outputs = 
    {self, utils, nixpkgs, ...}:
      let
        out = system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
            appliedOverlay = self.overlays.default pkgs pkgs;
          in
          {
            packages.default = appliedOverlay.plymouth-theme-jar-jar;
          };
      in
      utils.lib.eachDefaultSystem out // {
        overlays.default = final: prev: {
          plymouth-theme-jar-jar = prev.callPackage ./plymouth-theme-jar-jar.nix { };
        };
      };

  
}
