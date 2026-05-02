{
  lib,
  stdenvNoCC,
  fetchurl,
  p7zip,
  installFonts,
}:
let
  version = "1.028";

  source =
    with lib.attrsets;
    mapAttrs'
      (
        name: hash:
        nameValuePair (lib.strings.toLower name) (fetchurl {
          url = "https://github.com/GuiWonder/Shanggu/releases/download/${version}/Shanggu${name}TTCs.7z";
          inherit hash;
        })
      )
      {
        Mono = "sha256-QQgEUQbWOr3sOIT2yQpkY9cL2sHFO/Z/hrhV5YqA3Zk=";
        Round = "sha256-izPntZyAfeL/DuhDvZ+FWKq71Uj4WuHWC4d7Z3qEsvc=";
        Sans = "sha256-a05MO8vq+PqDlYtuDstN6hlx/IkNY0JCwcmlYYK3Xcw=";
        Serif = "sha256-A1/KygN+OC1e3p8T6OAN8jCAi8HuswkE/xjo65GVweY=";
      };

in
stdenvNoCC.mkDerivation {
  pname = "shanggu-fonts";
  inherit version;

  nativeBuildInputs = [
    p7zip
    installFonts
  ];

  unpackPhase = ''
    runHook preUnpack
  ''
  + lib.strings.concatLines (
    lib.attrsets.mapAttrsToList (name: value: ''
      7z x ${value} -o${name}
    '') source
  )
  + ''
    runHook postUnpack
  '';

  meta = {
    homepage = "https://github.com/GuiWonder/Shanggu";
    description = "Heritage glyph (old glyph) font based on Siyuan";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [ Cryolitia ];
  };
}
