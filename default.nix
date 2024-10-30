{
  rustPlatform,
  pkg-config,
  gtk4,
  src ? ./.,
}:
let
  meta = (builtins.fromTOML (builtins.readFile ./Cargo.toml)).package;
  pname = meta.name;
  version = meta.version;
in
rustPlatform.buildRustPackage {
  inherit pname version src;

  cargoLock.lockFile = ./Cargo.lock;

  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    gtk4
  ];
}
