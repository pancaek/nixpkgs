{
  lib,
  python312Packages,
  fetchFromGitHub,
  nix-update-script,
  installFonts,
}:

python312Packages.buildPythonPackage rec {
  pname = "ark-pixel-font";
  version = "2025.08.24";
  pyproject = false;

  outouts = [
    "out"
    "webfont"
  ];

  src = fetchFromGitHub {
    owner = "TakWolf";
    repo = "ark-pixel-font";
    tag = version;
    hash = "sha256-kxct994UmZhJBMlXZmayN24eiKqeG9T7GdyfsjBYpn0=";
  };

  dependencies = with python312Packages; [
    pixel-font-builder
    pixel-font-knife
    unidata-blocks
    character-encoding-utils
    pyyaml
    pillow
    beautifulsoup4
    jinja2
    loguru
    cyclopts
  ];

  nativeBuildInputs = [ installFonts ];

  buildPhase = ''
    runHook preBuild

    python -m tools.cli --cleanup

    runHook postBuild
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Open source pan-CJK pixel font";
    homepage = "https://ark-pixel-font.takwolf.com/";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ h7x4 ];
    platforms = lib.platforms.all;
  };
}
