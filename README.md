# wfc-cr

Crystal C-Bindings for [krychu/wfc](https://github.com/krychu/wfc)
to create random images using [wave function collapse](https://en.wikipedia.org/wiki/Wave_function_collapse)

## Installation

### Linux

1. Run
```sh
sh ./rsrc/install.sh
```
2. Add `wfc-cr` to your `shard.yml` dependencies like so:
```yml
dependencies:
  wfc-cr:
    github: D-Shwagginz/wfc-cr
```

### Windows

1. Follow the instructions at https://github.com/neatorobito/scoop-crystal to add the crystal-preview bucket to scoop
2. Install crystal with `scoop install crystal`
3. Run `.\rsrc\install.ps1` in powershell
4. Run in powershell
```powershell
$env:LIB="${env:LIB};C:\wfc"
$env:PATH="${env:PATH};C:\wfc"
```

OR

Run in cmd
```cmd
set PATH=%PATH%;C:\wfc
set LIB=%LIB%;C:\wfc
```

## Usage

Quick example:

```crystal
require "wfc-cr"

input_image = LibWFC.image_load("Path/To/Image.png")

wfc = LibWFC.overlapping(128, 128, input_image, 3, 3, 1, 1, 1, 1)

LibWFC.run(wfc, -1)

output_image = LibWFC.output_image(wfc)

LibWFC.image_save(output_image, "Path/To/MyNewImage.png")

LibWFC.image_destroy(input_image)
LibWFC.image_destroy(output_image)
LibWFC.destroy(wfc)
```

## Contributing

1. Fork it (<https://github.com/D-Shwagginz/wfc-cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [D. Shwagginz](https://github.com/D-Shwagginz) - creator and maintainer
- [Sol-vin](https://github.com/sol-vin) - provided the install scripts
