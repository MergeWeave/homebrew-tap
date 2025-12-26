# typed: false
# frozen_string_literal: true

class Mergeweave < Formula
  desc "CLI for real-time git conflict resolution and team synchronization"
  homepage "https://mergeweave.cloud"
  version "3.2.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "360e81db869a6990ee71edab67581d851c4df6439d4e3e4ff7a94581e32ad5b3"
    else
      # Intel Mac - ARM binary runs via Rosetta 2
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "360e81db869a6990ee71edab67581d851c4df6439d4e3e4ff7a94581e32ad5b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # ARM Linux - use x86_64 binary (works on most ARM systems with emulation)
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "3bba0f7f15b4c8413cf32692d70d303451ff2cde57c4cbfea49a32d941c6b0dc"
    else
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "3bba0f7f15b4c8413cf32692d70d303451ff2cde57c4cbfea49a32d941c6b0dc"
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
