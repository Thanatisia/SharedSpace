# Nix - Store cheatsheets

## Cheatsheets
### Store Paths
- Obtain the store path for a package
    - Explanation
        + '<nixpkgs>' : This is the primary package family/group containing the target package you want to search for
        + --no-build-output : Do not build the output paths returned by the search
        + `-A [package-group].[package-name]` : Specify additional packages to search
    ```bash
    nix-build '<nixpkgs>' --no-build-output -A [package-group].[package-name]
    ```

## Resources

## References
+ [NixOS Wiki - Cheatsheet](https://nixos.wiki/wiki/Cheatsheet)

## Remarks

