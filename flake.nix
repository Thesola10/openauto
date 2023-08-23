{
  inputs.nixpkgs.url = github:nixos/nixpkgs/nixos-23.05;
  inputs.aasdk.url = github:thesola10/aasdk;
  inputs.aasdk.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, aasdk, ... }: {
    packages.x86_64-linux.default = (import nixpkgs { system = "x86_64-linux"; }).callPackage ./default.nix { aasdk = aasdk.packages.x86_64-linux.default; };
  };
}
