{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ...}:
   utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.stdenv.mkDerivation
          {
            name = "plymouth-theme-jar-jar";
            src = ./.;
            installPhase = ''
              mkdir -p $out/share/plymouth/themes
              mv jar-jar $out/share/plymouth/themes/jar-jar
              sed -i "s@\/usr\/@$out\/@" $out/share/plymouth/themes/jar-jar/jar-jar.plymouth
            '';
          };
      });

}
