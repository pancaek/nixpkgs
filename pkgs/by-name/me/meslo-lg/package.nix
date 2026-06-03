{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  unzip,
  installFonts,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "meslo-lg";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "andreberg";
    repo = "Meslo-Font";
    tag = "v${finalAttrs.version}";
    hash = "";
    rootDir = "dist/v${finalAttrs.version}";
  };

  sourceRoot = ".";

  nativeBuildInputs = [
    unzip
    installFonts
  ];

  meta = {
    description = "Customized version of Apple’s Menlo-Regular font";
    homepage = "https://github.com/andreberg/Meslo-Font/";
    license = lib.licenses.asl20;
    maintainers = [ ];
    platforms = with lib.platforms; all;
  };
})
