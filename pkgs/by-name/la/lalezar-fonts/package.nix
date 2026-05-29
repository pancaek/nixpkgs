{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  installFonts,
}:

stdenvNoCC.mkDerivation {
  pname = "lalezar-fonts";
  version = "unstable-2017-02-28";

  outputs = [
    "out"
    "webfont"
  ];

  src = fetchFromGitHub {
    owner = "BornaIz";
    repo = "Lalezar";
    rev = "238701c4241f207e92515f845a199be9131c1109";
    hash = "sha256-95z58ABTx53aREXRpj9xgclX9kuGiQiiKBwqwnF6f8g=";
  };

  nativeBuildInputs = [ installFonts ];

  meta = {
    homepage = "https://github.com/BornaIz/Lalezar";
    description = "Multi-script display typeface for popular culture";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
