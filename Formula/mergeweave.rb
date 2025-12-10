# typed: false
# frozen_string_literal: true

class Mergeweave < Formula
  desc "CLI for real-time git conflict resolution and team synchronization"
  homepage "https://mergeweave.cloud"
  version "3.1.23-rc3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "856e0b3414d8c9c65f0a396412aebdc38b9403d9863e8725e8c9057372c3676d"
    else
      # Intel Mac - ARM binary runs via Rosetta 2
      url "https://api.mergeweave.cloud/downloads/v#{version}/darwin-arm64/mergeweave"
      sha256 "856e0b3414d8c9c65f0a396412aebdc38b9403d9863e8725e8c9057372c3676d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # ARM Linux - use x86_64 binary (works on most ARM systems with emulation)
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "2b7347a723c9969194ca2ac83118caf6c7e3d7bc5b56e514813dae349cb75050"
    else
      url "https://api.mergeweave.cloud/downloads/v#{version}/linux-amd64/mergeweave"
      sha256 "2b7347a723c9969194ca2ac83118caf6c7e3d7bc5b56e514813dae349cb75050"
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
