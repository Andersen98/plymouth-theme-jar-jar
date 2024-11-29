{ stdenv }:

stdenv.mkDerivation {
  pname = "plymouth-theme-jar-jar";
  version = "v1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes
    mv jar-jar $out/share/plymouth/themes/jar-jar
    sed -i "s@\/usr\/@$out\/@" $out/share/plymouth/themes/jar-jar/jar-jar.plymouth
  '';
}
