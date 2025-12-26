# typed: false
# frozen_string_literal: true

class Mergeweave < Formula
  desc "CLI for real-time git conflict resolution and team synchronization"
  homepage "https://mergeweave.cloud"
  version "3.2.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "b301c16bf48a2f33d91ff5ae529e65bb8d54f8d97a39ae7dc24e8eaa94272bbd"
    else
      # Intel Mac - ARM binary runs via Rosetta 2
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "b301c16bf48a2f33d91ff5ae529e65bb8d54f8d97a39ae7dc24e8eaa94272bbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # ARM Linux - use x86_64 binary (works on most ARM systems with emulation)
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "63b4d2757528b59adc1088ff1a54d01efe1ed2e6cae6f0cada442e4c60857858"
    else
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "63b4d2757528b59adc1088ff1a54d01efe1ed2e6cae6f0cada442e4c60857858"
    end
  end

  def install
    bin.install "mergeweave"
  end

  def caveats
    <<~EOS
      To get started, authenticate with MergeWeave:
        mergeweave auth

      Then register a repository:
        cd /path/to/your/repo
        mergeweave init

      Start the watch daemon:
        mergeweave watch

      For help and documentation:
        mergeweave --help
        https://mergeweave.cloud/docs
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mergeweave --version")
  end
end
