# typed: false
# frozen_string_literal: true

class Mergeweave < Formula
  desc "CLI for real-time git conflict resolution and team synchronization"
  homepage "https://mergeweave.cloud"
  version "3.1.23-rc4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "f0dc6c4744a491fc5ae4deaacb43c0db4121d7a3a35ec8c0c2e4561ade15ec28"
    else
      # Intel Mac - ARM binary runs via Rosetta 2
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "f0dc6c4744a491fc5ae4deaacb43c0db4121d7a3a35ec8c0c2e4561ade15ec28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # ARM Linux - use x86_64 binary (works on most ARM systems with emulation)
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "939aed30091475f4cf673747153329b5aa162ec0db88a0105e9df20872823025"
    else
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "939aed30091475f4cf673747153329b5aa162ec0db88a0105e9df20872823025"
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
