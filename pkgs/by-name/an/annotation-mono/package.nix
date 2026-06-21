{
  lib,
  stdenvNoCC,
  fetchzip,
  installFonts,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "annotation-mono";
  version = "0.4";

  outputs = [
    "out"
    "webfont"
  ];

  src = fetchzip {
    url = "https://github.com/qwerasd205/AnnotationMono/releases/download/v${finalAttrs.version}/AnnotationMono_v${finalAttrs.version}.zip";
    hash = "sha256-6DEYTYAENNY/5oD9us9f7VtPae/it7qrFC3/UT1J+Qg=";
    stripRoot = false;
  };

  nativeBuildInputs = [ installFonts ];

  preInstall = ''
      rm -r __MACOSX
      find dist -type f ! -name 'AnnotationMono*' -exec sh -c '
      for file; do
        mv "$file" "$(dirname "$file")/AnnotationMono-$(basename "$file")"
      done
    ' sh {} +
  '';

  meta = {
    homepage = "https://github.com/qwerasd205/AnnotationMono";
    description = "Lovingly crafted handwriting-style monospace font";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = [ lib.maintainers.theonlymrcat ];
  };
})
