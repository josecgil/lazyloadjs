if (Test-Path ../dist) {
    Remove-Item ../dist -recurse
}

New-Item ../dist/lazyload.coffee -type file -force

Get-Content ../src/*.coffee | Set-Content ../dist/lazyload.coffee

coffee -c ../dist/lazyload.coffee
uglifyjs ../dist/lazyload.js -c -o ../dist/lazyload.min.js