#!/usr/bin/env python3

import os
import subprocess
import json
import argparse


def get_changed_files(base_branch):
    """Get a list of changed files between the current branch and the base branch."""
    try:
        result = subprocess.run(
            ['git', 'diff', '--name-only', base_branch],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=True
        )
        changed_files = result.stdout.decode('utf-8').splitlines()
        return changed_files
    except subprocess.CalledProcessError as e:
        print(f"Error: {e.stderr.decode('utf-8')}")
        exit(1)


def get_version_from_branch(directory, branch):
    """Get the version from the devcontainer-feature.json file in the specified branch."""
    try:
        result = subprocess.run(
            ['git', 'show', f'{branch}:{directory}/devcontainer-feature.json'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=True
        )
        data = json.loads(result.stdout.decode('utf-8'))
        return data.get('version')
    except subprocess.CalledProcessError as e:
        print(f"Error: {e.stderr.decode('utf-8')}")
        exit(1)
    except json.JSONDecodeError as e:
        print(
            f"Error decoding JSON from {directory}/devcontainer-feature.json in {branch}: {e}")
        exit(1)


def is_version_bump_required(directory, base_branch):
    """Check if the version in the current branch is greater than the version in the base branch."""
    current_version = get_version_from_branch(directory, 'HEAD')
    base_version = get_version_from_branch(directory, base_branch)

    bump_required = False

    if current_version and base_version:
        if current_version > base_version:
            print(
                f"✅ Version bump detected for {directory}. Current version: {current_version}, Base version: {base_version}")
        else:
            bump_required = True
            print(
                f"❗ Version bump required for {directory}. Current version: {current_version}, Base version: {base_version}")
    else:
        print(f"Error: Could not determine versions for {directory}")

    return bump_required


def main():
    parser = argparse.ArgumentParser(
        description="Check for version bumps in changed directories.")
    parser.add_argument('--base-branch', type=str, default='main',
                        help='Base branch to compare changes against')
    args = parser.parse_args()

    base_branch = args.base_branch
    changed_files = get_changed_files(base_branch)

    # Get unique directories under src/ that have changes
    changed_dirs = {os.path.dirname(
        file) for file in changed_files if file.startswith('src/')}

    bump_required = False
    for directory in changed_dirs:
        check_result = is_version_bump_required(directory, base_branch)
        if check_result:
            bump_required = True

    if bump_required:
        exit(1)


if __name__ == "__main__":
    main()
