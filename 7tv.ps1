$data = irm https://7tv.io/v3/emote-sets/65a6d017888d90ac522693b8

$data.emotes | ForEach-Object {
    $name = $_.name
    $url = "https:" + $_.data.host.url + "/" + $_.data.host.files[1].name

    irm $url -OutFile ".\webp\$($name).webp"
    sleep 1
}