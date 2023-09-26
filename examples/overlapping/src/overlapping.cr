require "wfc-cr"

INPUT_FILENAME  = "./rsrc/square.png"
OUTPUT_FILENAME = "./rsrc/output.png"

input_image = WFC.image_load(INPUT_FILENAME)
if input_image.nil?
  raise "Error loading file:\n#{INPUT_FILENAME}"
end

wfc = WFC.overlapping(
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
  WFC.image_destroy(input_image)
  raise "Error creating wfc"
end

puts "Running ..."
if !WFC.run(wfc, -1)
  WFC.image_destroy(input_image)
  WFC.destroy(wfc)
  raise "Contradiction occured, try again"
end

output_image = WFC.output_image(wfc)
if !WFC.image_save(output_image, OUTPUT_FILENAME)
  WFC.image_destroy(input_image)
  WFC.image_destroy(output_image)
  WFC.destroy(wfc)
  raise "Error saving file: #{OUTPUT_FILENAME}"
end

WFC.image_destroy(input_image)
WFC.image_destroy(output_image)
WFC.destroy(wfc)
