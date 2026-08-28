{
  description = "torchlight.nvim development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        # hsluv is not in nixpkgs, so build the rock from the upstream repo.
        # Its own rockspec fetches an unpinned git master, which nix cannot
        # reproduce, so pin the revision here and let luarocks build in place.
        hsluv = pkgs.luajitPackages.buildLuarocksPackage {
          pname = "hsluv";
          version = "0.1-1";
          src = pkgs.fetchFromGitHub {
            owner = "hsluv";
            repo = "hsluv-lua";
            rev = "be26eba8c76f41ab8de274d99c102f00162db91c";
            hash = "sha256-1kDAt1CKlbfQCOXgpnxLEeMlq69e4WhJOLTs/DiGU50=";
          };
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            # The test runner drives a real nvim, so the colorscheme is
            # exercised against the actual highlight API rather than a stub.
            pkgs.neovim

            # vusted runs busted specs inside nvim. It shells out to `nvim`
            # by name, which the neovim package above puts on PATH, and to
            # `luarocks` to resolve its own module paths.
            pkgs.luajitPackages.vusted
            pkgs.luajitPackages.luarocks

            pkgs.luajitPackages.luacheck
            pkgs.stylua

            # HSLuv conversions, for perceptual analysis of the palette.
            hsluv
          ];
        };
      }
    );
}
