{
  pkgs,
  lib,
  config,
  ...
}: {
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    wireplumber.enable = true;
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
