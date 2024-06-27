{ config, pkgs, lib, ... }:

{

  options = {                                                                                                                                    
    nvidia.enable = lib.mkEnableOption "enable nvidia module";                                                                                  
  };
                                                                                                                                                 
  config = lib.mkIf config.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];                                                                                                    
    hardware.opengl = {                                                                                                                            
      enable = true;                                                                                                                               
      driSupport = true;                                                                                                                           
      driSupport32Bit = true;                                                                                                                      
    };                                                                                                                                                                                                                                                                                           
    hardware.nvidia = {                                                                                                                            
      modesetting.enable = true;                                                                                                                   
      powerManagement.enable = true;                                                                                                               
      powerManagement.finegrained = false;                                                                                                         
      open = false;                                                                                                                                
      nvidiaSettings = true;                                                                                                                       
      package = config.boot.kernelPackages.nvidiaPackages.stable;                                                                                  
    };
  };
}
