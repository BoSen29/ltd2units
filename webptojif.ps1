cd .\webp

$env:PATH = $env:PATH + "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI"

$magik = "magick mogrify -format gif *.webp"

iex $magik

cd ..

mv ./webp/*.gif ./jifs

$emotes = ls ./jifs

$out = @{}

$emotes | ForEach-Object {
    $out[$_.Name.Replace('.gif', '')] = "https://ltd2.krettur.no/units/jifs/" + $_.Name
}

$out | Convertto-json | out-file ../ltd2socket/emotes.json