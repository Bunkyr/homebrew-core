class Xc3sprog < Formula
  desc "Utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs with JTAG adapters"
  homepage "https://github.com/bunkyr/xc3sprog"
  url "https://github.com/bunkyr/xc3sprog/archive/v0.1.1.tar.gz"
  sha256 "fd03f1eed8ca810241d160b14df767bfc7fa47628add8e277f40cc3d8cbdc3de"
  head "https://github.com/bunkyr/xc3sprog.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libusb" => :build
  depends_on "libusb-compat" => :build
  depends_on "libftdi" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
