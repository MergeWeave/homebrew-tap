# typed: false
# frozen_string_literal: true

class Mergeweave < Formula
  desc "CLI for real-time git conflict resolution and team synchronization"
  homepage "https://mergeweave.cloud"
  version "3.1.23-rc2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "d1a188cce7e47c760f503f7c3b382855bfc0676ccb423adc0d7da604f56e0eb0"
    else
      # Intel Mac - ARM binary runs via Rosetta 2
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "d1a188cce7e47c760f503f7c3b382855bfc0676ccb423adc0d7da604f56e0eb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # ARM Linux - use x86_64 binary (works on most ARM systems with emulation)
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "9f34475f256fe1ddb36bb182b9340fc291209cda13aec31e6107eb350dbc93f6"
    else
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "9f34475f256fe1ddb36bb182b9340fc291209cda13aec31e6107eb350dbc93f6"
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
