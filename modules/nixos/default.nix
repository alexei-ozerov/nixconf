{ mkgs, lib, ...}:
{
  imports = [
    ./main-user.nix
    ./nvidia.nix
  ];

  main-user.enable = lib.mkDefault true;
  nvidia.enable = lib.mkDefault false;
}
