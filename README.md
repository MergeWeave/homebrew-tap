# MergeWeave Homebrew Tap

Official Homebrew tap for [MergeWeave](https://mergeweave.cloud) - the intelligent Git conflict resolution CLI.

## Installation

```bash
# Add the tap
brew tap mergeweave/tap

# Install MergeWeave CLI
brew install mergeweave
```

## Updating

```bash
brew update
brew upgrade mergeweave
```

## What is MergeWeave?

MergeWeave is a CLI tool that helps developers resolve Git merge conflicts using intelligent, AI-powered resolution strategies. It provides:

- **Automatic conflict resolution** - Resolves common merge conflicts automatically
- **Real-time synchronization** - Watch mode keeps your local branches in sync
- **Team collaboration** - Share resolution strategies across your team
- **Multi-platform support** - Works on macOS, Linux, and Windows

## Getting Started

After installation:

```bash
# Authenticate with MergeWeave
mergeweave auth

# Initialize a repository
cd /path/to/your/repo
mergeweave init

# Start the watch daemon
mergeweave watch
```

## Documentation

- [MergeWeave Documentation](https://mergeweave.cloud/docs)
- [API Documentation](https://api.mergeweave.cloud/docs)

## Support

- [GitHub Issues](https://github.com/TylerSThomas/mw_conflict_resolution_engine/issues)
- Email: support@mergeweave.cloud

## License

MergeWeave CLI is proprietary software. See [mergeweave.cloud](https://mergeweave.cloud) for licensing information.