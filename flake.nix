{
  description = "My Wallpaper Collection";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "wallpapers";
        src = ./wallpapers;
        installPhase = ''
          mkdir -p $out/share/wallpapers
          cp -r ./* $out/share/wallpapers/
        '';
      };

      lib = {
        arcade = ./wallpapers/arcade.webp;
        bloom = ./wallpapers/bloom.webp;
        hiatus = ./wallpapers/hiatus.jpg;
        strings = ./wallpapers/strings.webp;
        town = ./wallpapers/town.webp;
        waves = ./wallpapers/waves.webp;
        witch = ./wallpapers/witch.jpg;
      };
    };
}
