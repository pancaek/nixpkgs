{
  stdenvNoCC,
  lib,
  fetchurl,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "quivira";
  version = "4.1";

  src = fetchurl {
    url = "http://www.quivira-font.com/files/Quivira.otf";
    hash = "";
  };

  meta = {
    description = "Free Unicode font in the OpenType format which is supported by every usual office program or printer";
    homepage = "http://www.quivira-font.com/";
    license = lib.licenses.publicDomain;
    maintainers = [ lib.maintainers.nosewings ];
    # From the homepage: "If you try to install Quivira on a Mac,
    # you will get an error message about the 'post table
    # usability'."
    platforms = lib.filter (platform: !lib.hasInfix "darwin" platform) lib.platforms.all;
  };
})
