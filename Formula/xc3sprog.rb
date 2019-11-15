class Xc3sprog < Formula
  desc "Utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs with JTAG adapters"
  homepage "https://github.com/bunkyr/xc3sprog"
  url "https://github.com/bunkyr/xc3sprog/archive/v0.1.0.tar.gz"
  sha256 "dc30a408d215c265c7b00d3c63583a2ad40a5de8124cdce82649a10fa8273c8b"
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
