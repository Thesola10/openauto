{ pkgs, stdenv, aasdk, h264bitstream }:

stdenv.mkDerivation {
  name = "openauto";
  src = ./.;

  nativeBuildInputs = with pkgs;
  [ cmake
    git
    chrpath
    qt5.wrapQtAppsHook
    pkgconfig
  ];

  cmakeFlags =
    let ext = stdenv.targetPlatform.extensions.library;
    in
    [ "-DRPI_BUILD=FALSE"
      "-DAASDK_INCLUDE_DIR=${aasdk}/include"
      "-DAASDK_PROTO_INCLUDE_DIR=${aasdk}/include"
      "-DAASDK_LIBRARIES=${aasdk}/lib/libaasdk${ext}"
      "-DAASDK_PROTO_LIBRARIES=${aasdk}/lib/libaasdk_proto${ext}"
      "-DCMAKE_SKIP_RPATH=TRUE"
    ];

  buildInputs = with pkgs;
  [ aasdk
    boost168
    qt5.qtconnectivity
    qt5.qtmultimedia
    qt5.qtbase
    rtaudio
    h264bitstream
  ];
}
