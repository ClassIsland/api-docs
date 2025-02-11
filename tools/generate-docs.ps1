param($ref)


if (Test-Path -Path ./ClassIsland) {
    Remove-Item -Path ./ClassIsland -Recurse -Force
}

git clone --recursive git@github.com:ClassIsland/ClassIsland.git
Set-Location .\ClassIsland
if ($null -eq $ref) {
    $ref = $(git tag --sort=-creatordate)[0]
}
git checkout $ref
Set-Location ..

dotnet tool install -g docfx
docfx ./docfx.json
