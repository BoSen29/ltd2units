$out = [ordered]@{}
$emotes = ls ./jifs

$emotes | sort {$_.Name.Length} | ForEach-Object {
    $out[$_.Name.Replace('.gif', '').Replace('.png', '')] = "https://ltd2.krettur.no/units/jifs/" + $_.Name
}

$out | Convertto-json | out-file ../ltd2socket/emotes.json