param($ref)

$ErrorActionPreference = 'Stop'

# git clone --recursive https://github.com/ClassIsland/ClassIsland.git
Set-Location .\ClassIsland
if ($null -eq $ref) {
    $ref = $(git tag --sort=-creatordate)[0]
}
git checkout $ref
Set-Location ..

dotnet tool install -g docfx
docfx ./docfx.json
