require "wfc-cr"

INPUT_FILENAME  = "./rsrc/square.png"
OUTPUT_FILENAME = "./rsrc/output.png"

input_image = LibWFC.image_load(INPUT_FILENAME)
if input_image.nil?
  raise "Error loading file:\n#{INPUT_FILENAME}"
end

wfc = LibWFC.overlapping(
  128,
  128,
  input_image,
  3,
  3,
  false,
  true,
  true,
  1
)

if !wfc
  LibWFC.image_destroy(input_image)
  raise "Error creating wfc"
end

puts "Running ..."
if !LibWFC.run(wfc, -1)
  LibWFC.image_destroy(input_image)
  LibWFC.destroy(wfc)
  raise "Contradiction occured, try again"
end

output_image = LibWFC.output_image(wfc)
if !LibWFC.image_save(output_image, OUTPUT_FILENAME)
  LibWFC.image_destroy(input_image)
  LibWFC.image_destroy(output_image)
  LibWFC.destroy(wfc)
  raise "Error saving file: #{OUTPUT_FILENAME}"
end

LibWFC.image_destroy(input_image)
LibWFC.image_destroy(output_image)
LibWFC.destroy(wfc)
