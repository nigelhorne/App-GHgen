# App::GHGen

GitHub Actions workflow generator and analyzer - create optimized CI/CD workflows and identify issues in existing ones.

## Features

- 🚀 **Generate workflows** for 8+ languages/platforms
- 🔍 **Analyze existing workflows** for performance and security issues
- 🤖 **Auto-detect project type** from repository contents
- ✨ **Best practices built-in** - caching, concurrency, pinned versions
- 💰 **Cost optimization** - suggests ways to reduce CI minutes
- 🎯 **Interactive mode** - guided workflow creation

## Installation

```bash
cpanm App::GHGen
```

Or from source:

```bash
git clone https://github.com/yourusername/App-GHGen.git
cd App-GHGen
cpanm --installdeps .
perl Makefile.PL
make
make test
make install
```

## Usage

### Generate Workflows

Generate a workflow for your project type:

```bash
# Auto-detect project type (recommended!)
cd my-project
ghgen generate --auto

# Or specify type explicitly
ghgen generate --type=perl

# Node.js project
ghgen generate --type=node

# Interactive mode
ghgen generate --interactive

# Custom output location
ghgen generate --type=rust --output=.github/workflows/rust-check.yml

# List all available types
ghgen generate --list
```

### Analyze Workflows

Check existing workflows for issues:

```bash
ghgen analyze
```

The analyzer checks for:
- ❌ Missing dependency caching
- ❌ Unpinned action versions (@master, @main)
- ❌ Overly broad triggers (all pushes)
- ❌ Missing concurrency controls
- ❌ Outdated runner versions

Each issue includes a suggested fix you can copy-paste.

## Supported Project Types

| Type | Description |
|------|-------------|
| `perl` | Multi-OS Perl testing with cpanm, coverage, and Perl::Critic |
| `node` | Node.js with npm, multiple versions, linting |
| `python` | Python with pip, pytest, coverage, flake8 |
| `rust` | Rust with cargo, clippy, formatting |
| `go` | Go with testing, race detection, coverage |
| `ruby` | Ruby with bundler and rake |
| `docker` | Docker image build and push to registry |
| `static` | Static site deployment to GitHub Pages |

## Examples

### Auto-detect and generate

The easiest way to use ghgen is with auto-detection:

```bash
cd my-perl-project/
ghgen generate --auto
```

Output:
```
Auto-detecting project type...

✓ Detected project type: PERL
  Evidence: cpanfile, lib, t

Generate PERL workflow? [Y/n]: y
✓ Generated workflow: .github/workflows/perl-ci.yml

Next steps:
  1. Review the generated workflow
  2. Customize it for your project
  3. Commit and push to trigger the workflow

💡 Tip: Run 'ghgen analyze' to check for optimizations
```

The detector looks for:
- **Perl**: cpanfile, dist.ini, Makefile.PL, lib/*.pm, t/*.t
- **Node.js**: package.json, package-lock.json, yarn.lock
- **Python**: requirements.txt, setup.py, pyproject.toml
- **Rust**: Cargo.toml, Cargo.lock
- **Go**: go.mod, go.sum
- **Ruby**: Gemfile, Rakefile
- **Docker**: Dockerfile, docker-compose.yml

### Generate a Perl CI workflow

```bash
cd my-perl-project/
ghgen generate --type=perl
```

This creates `.github/workflows/perl-ci.yml` that:
- Tests on macOS, Ubuntu, and Windows
- Tests Perl versions 5.22 through 5.40
- Caches CPAN modules
- Runs tests, Perl::Critic, and coverage
- Sets proper environment variables

### Analyze workflows

```bash
cd my-project/
ghgen analyze
```

Output:
```
GitHub Actions Workflow Analyzer
==================================================

📄 Analyzing: ci.yml
  ⚠ No dependency caching found - increases build times and costs
     💡 Fix:
     - uses: actions/cache@v5
       with:
         path: ~/.npm
         key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}

  ⚠ Workflow triggers on all pushes - consider path/branch filters
     💡 Fix:
     Add trigger filters:
     on:
       push:
         branches: [main, develop]

==================================================
Summary:
  Workflows analyzed: 1
  Total issues found: 2
```

## Development

```bash
# Clone the repo
git clone https://github.com/yourusername/App-GHGen.git
cd App-GHGen

# Install dependencies
cpanm --installdeps .

# Run tests
prove -lr t/

# Install locally
cpanm .
```

## Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## License

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

## Author

Your Name <your.email@example.com>

## See Also

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Actions Best Practices](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions)
