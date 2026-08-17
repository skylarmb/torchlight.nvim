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
          ];
        };
      }
    );
}
