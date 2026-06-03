{
  lib,
  stdenvNoCC,
  texlive,
  installFonts,
}:

stdenvNoCC.mkDerivation rec {
  inherit (src) pname version;

  src = texlive.pkgs.iwona;

  nativeBuildInputs = [ installFonts ];

  meta = {
    description = "Two-element sans-serif typeface, created by Małgorzata Budyta";
    homepage = "https://jmn.pl/en/kurier/";
    # "[...] GUST Font License (GFL), which is a free license, legally
    # equivalent to the LaTeX Project Public # License (LPPL), version 1.3c or
    # later." - GUST website
    license = src.meta.license;
    maintainers = with lib.maintainers; [ siddharthist ];
    platforms = lib.platforms.all;
  };
}
