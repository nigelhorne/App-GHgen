package App::GHGen;
use v5.36;
use warnings;

our $VERSION = '0.01';

=head1 NAME

App::GHGen - GitHub Actions workflow generator and analyzer

=head1 SYNOPSIS

    use App::GHGen;
    
    # Command-line usage:
    ghgen generate --type=perl
    ghgen analyze

=head1 DESCRIPTION

App::GHGen helps you create and optimize GitHub Actions workflows. It can:

=over 4

=item * Generate optimized CI/CD workflows for various languages

=item * Analyze existing workflows for performance and cost issues

=item * Suggest improvements and fixes

=back

=head1 SUPPORTED LANGUAGES

=over 4

=item * Node.js/npm

=item * Python

=item * Rust

=item * Go

=item * Ruby

=item * Perl

=item * Docker

=item * Static sites (GitHub Pages)

=back

=head1 AUTHOR

Nigel Horne <njh@nigelhorne.com>

=head1 LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

1;
